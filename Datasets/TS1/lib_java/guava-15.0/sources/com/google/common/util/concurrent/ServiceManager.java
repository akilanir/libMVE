package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.base.Function;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicates;
import com.google.common.base.Stopwatch;
import com.google.common.collect.Collections2;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMultimap;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.collect.Ordering;
import com.google.common.util.concurrent.Monitor;
import com.google.common.util.concurrent.Service;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.concurrent.GuardedBy;
import javax.annotation.concurrent.Immutable;
import javax.inject.Inject;
import javax.inject.Singleton;

@Singleton
@Beta
/* loaded from: guava-15.0.jar:com/google/common/util/concurrent/ServiceManager.class */
public final class ServiceManager {
    private static final Logger logger = Logger.getLogger(ServiceManager.class.getName());
    private final ServiceManagerState state;
    private final ImmutableMap<Service, ServiceListener> services;

    @Beta
    /* loaded from: guava-15.0.jar:com/google/common/util/concurrent/ServiceManager$Listener.class */
    public static abstract class Listener {
        public void healthy() {
        }

        public void stopped() {
        }

        public void failure(Service service) {
        }
    }

    public ServiceManager(Iterable<? extends Service> services) {
        ImmutableList<Service> copy = ImmutableList.copyOf(services);
        if (copy.isEmpty()) {
            logger.log(Level.WARNING, "ServiceManager configured with no services.  Is your application configured properly?", (Throwable) new EmptyServiceManagerWarning());
            copy = ImmutableList.of(new NoOpService());
        }
        this.state = new ServiceManagerState(copy.size());
        ImmutableMap.Builder<Service, ServiceListener> builder = ImmutableMap.builder();
        Executor executor = MoreExecutors.sameThreadExecutor();
        Iterator i$ = copy.iterator();
        while (i$.hasNext()) {
            Service service = (Service) i$.next();
            ServiceListener listener = new ServiceListener(service, this.state);
            service.addListener(listener, executor);
            Preconditions.checkArgument(service.state() == Service.State.NEW, "Can only manage NEW services, %s", service);
            builder.put(service, listener);
        }
        this.services = builder.build();
    }

    @Inject
    ServiceManager(Set<Service> services) {
        this((Iterable<? extends Service>) services);
    }

    public void addListener(Listener listener, Executor executor) {
        this.state.addListener(listener, executor);
    }

    public void addListener(Listener listener) {
        this.state.addListener(listener, MoreExecutors.sameThreadExecutor());
    }

    public ServiceManager startAsync() {
        Iterator i$ = this.services.entrySet().iterator();
        while (i$.hasNext()) {
            Map.Entry<Service, ServiceListener> entry = (Map.Entry) i$.next();
            Service service = entry.getKey();
            Service.State state = service.state();
            Preconditions.checkState(state == Service.State.NEW, "Service %s is %s, cannot start it.", service, state);
        }
        Iterator i$2 = this.services.values().iterator();
        while (i$2.hasNext()) {
            ServiceListener service2 = (ServiceListener) i$2.next();
            try {
                service2.start();
            } catch (IllegalStateException e) {
                logger.log(Level.WARNING, "Unable to start Service " + service2.service, (Throwable) e);
            }
        }
        return this;
    }

    public void awaitHealthy() {
        this.state.awaitHealthy();
        Preconditions.checkState(isHealthy(), "Expected to be healthy after starting");
    }

    public void awaitHealthy(long timeout, TimeUnit unit) throws TimeoutException {
        if (!this.state.awaitHealthy(timeout, unit)) {
            throw new TimeoutException("Timeout waiting for the services to become healthy.");
        }
        Preconditions.checkState(isHealthy(), "Expected to be healthy after starting");
    }

    public ServiceManager stopAsync() {
        Iterator i$ = this.services.keySet().iterator();
        while (i$.hasNext()) {
            Service service = (Service) i$.next();
            service.stop();
        }
        return this;
    }

    public void awaitStopped() {
        this.state.awaitStopped();
    }

    public void awaitStopped(long timeout, TimeUnit unit) throws TimeoutException {
        if (!this.state.awaitStopped(timeout, unit)) {
            throw new TimeoutException("Timeout waiting for the services to stop.");
        }
    }

    public boolean isHealthy() {
        Iterator i$ = this.services.keySet().iterator();
        while (i$.hasNext()) {
            Service service = (Service) i$.next();
            if (!service.isRunning()) {
                return false;
            }
        }
        return true;
    }

    public ImmutableMultimap<Service.State, Service> servicesByState() {
        ImmutableMultimap.Builder<Service.State, Service> builder = ImmutableMultimap.builder();
        Iterator i$ = this.services.keySet().iterator();
        while (i$.hasNext()) {
            Service service = (Service) i$.next();
            if (!(service instanceof NoOpService)) {
                builder.put(service.state(), service);
            }
        }
        return builder.build();
    }

    public ImmutableMap<Service, Long> startupTimes() {
        List<Map.Entry<Service, Long>> loadTimes = Lists.newArrayListWithCapacity(this.services.size());
        Iterator i$ = this.services.entrySet().iterator();
        while (i$.hasNext()) {
            Map.Entry<Service, ServiceListener> entry = (Map.Entry) i$.next();
            Service service = entry.getKey();
            Service.State state = service.state();
            if ((state != Service.State.NEW) & (state != Service.State.STARTING) & (!(service instanceof NoOpService))) {
                loadTimes.add(Maps.immutableEntry(service, Long.valueOf(entry.getValue().startupTimeMillis())));
            }
        }
        Collections.sort(loadTimes, Ordering.natural().onResultOf(new Function<Map.Entry<Service, Long>, Long>() { // from class: com.google.common.util.concurrent.ServiceManager.1
            @Override // com.google.common.base.Function
            public Long apply(Map.Entry<Service, Long> input) {
                return input.getValue();
            }
        }));
        ImmutableMap.Builder<Service, Long> builder = ImmutableMap.builder();
        Iterator i$2 = loadTimes.iterator();
        while (i$2.hasNext()) {
            builder.put(i$2.next());
        }
        return builder.build();
    }

    public String toString() {
        return Objects.toStringHelper((Class<?>) ServiceManager.class).add("services", Collections2.filter(this.services.keySet(), Predicates.not(Predicates.instanceOf(NoOpService.class)))).toString();
    }

    /* loaded from: guava-15.0.jar:com/google/common/util/concurrent/ServiceManager$ServiceManagerState.class */
    private static final class ServiceManagerState {
        final int numberOfServices;

        @GuardedBy("monitor")
        int unstartedServices;

        @GuardedBy("monitor")
        int unstoppedServices;
        final Monitor monitor = new Monitor();
        final Monitor.Guard awaitHealthGuard = new Monitor.Guard(this.monitor) { // from class: com.google.common.util.concurrent.ServiceManager.ServiceManagerState.1
            @Override // com.google.common.util.concurrent.Monitor.Guard
            public boolean isSatisfied() {
                return (ServiceManagerState.this.unstartedServices == 0) | (ServiceManagerState.this.unstoppedServices != ServiceManagerState.this.numberOfServices);
            }
        };
        final Monitor.Guard stoppedGuard = new Monitor.Guard(this.monitor) { // from class: com.google.common.util.concurrent.ServiceManager.ServiceManagerState.2
            @Override // com.google.common.util.concurrent.Monitor.Guard
            public boolean isSatisfied() {
                return ServiceManagerState.this.unstoppedServices == 0;
            }
        };

        @GuardedBy("monitor")
        final List<ListenerExecutorPair> listeners = Lists.newArrayList();

        @GuardedBy("monitor")
        final ExecutionQueue queuedListeners = new ExecutionQueue();

        ServiceManagerState(int numberOfServices) {
            this.numberOfServices = numberOfServices;
            this.unstoppedServices = numberOfServices;
            this.unstartedServices = numberOfServices;
        }

        void addListener(Listener listener, Executor executor) {
            Preconditions.checkNotNull(listener, "listener");
            Preconditions.checkNotNull(executor, "executor");
            this.monitor.enter();
            try {
                if (this.unstartedServices > 0 || this.unstoppedServices > 0) {
                    this.listeners.add(new ListenerExecutorPair(listener, executor));
                }
            } finally {
                this.monitor.leave();
            }
        }

        void awaitHealthy() {
            this.monitor.enterWhenUninterruptibly(this.awaitHealthGuard);
            this.monitor.leave();
        }

        boolean awaitHealthy(long timeout, TimeUnit unit) {
            if (this.monitor.enterWhenUninterruptibly(this.awaitHealthGuard, timeout, unit)) {
                this.monitor.leave();
                return true;
            }
            return false;
        }

        void awaitStopped() {
            this.monitor.enterWhenUninterruptibly(this.stoppedGuard);
            this.monitor.leave();
        }

        boolean awaitStopped(long timeout, TimeUnit unit) {
            if (this.monitor.enterWhenUninterruptibly(this.stoppedGuard, timeout, unit)) {
                this.monitor.leave();
                return true;
            }
            return false;
        }

        /* JADX INFO: Access modifiers changed from: private */
        @GuardedBy("monitor")
        public void serviceFinishedStarting(Service service, boolean currentlyHealthy) {
            Preconditions.checkState(this.unstartedServices > 0, "All services should have already finished starting but %s just finished.", service);
            this.unstartedServices--;
            if (currentlyHealthy && this.unstartedServices == 0 && this.unstoppedServices == this.numberOfServices) {
                for (final ListenerExecutorPair pair : this.listeners) {
                    this.queuedListeners.add(new Runnable() { // from class: com.google.common.util.concurrent.ServiceManager.ServiceManagerState.3
                        @Override // java.lang.Runnable
                        public void run() {
                            pair.listener.healthy();
                        }
                    }, pair.executor);
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        @GuardedBy("monitor")
        public void serviceTerminated(Service service) {
            serviceStopped(service);
        }

        /* JADX INFO: Access modifiers changed from: private */
        @GuardedBy("monitor")
        public void serviceFailed(final Service service) {
            for (final ListenerExecutorPair pair : this.listeners) {
                this.queuedListeners.add(new Runnable() { // from class: com.google.common.util.concurrent.ServiceManager.ServiceManagerState.4
                    @Override // java.lang.Runnable
                    public void run() {
                        pair.listener.failure(service);
                    }
                }, pair.executor);
            }
            serviceStopped(service);
        }

        @GuardedBy("monitor")
        private void serviceStopped(Service service) {
            Preconditions.checkState(this.unstoppedServices > 0, "All services should have already stopped but %s just stopped.", service);
            this.unstoppedServices--;
            if (this.unstoppedServices == 0) {
                Preconditions.checkState(this.unstartedServices == 0, "All services are stopped but %d services haven't finished starting", Integer.valueOf(this.unstartedServices));
                for (final ListenerExecutorPair pair : this.listeners) {
                    this.queuedListeners.add(new Runnable() { // from class: com.google.common.util.concurrent.ServiceManager.ServiceManagerState.5
                        @Override // java.lang.Runnable
                        public void run() {
                            pair.listener.stopped();
                        }
                    }, pair.executor);
                }
                this.listeners.clear();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void executeListeners() {
            Preconditions.checkState(!this.monitor.isOccupiedByCurrentThread(), "It is incorrect to execute listeners with the monitor held.");
            this.queuedListeners.execute();
        }
    }

    /* loaded from: guava-15.0.jar:com/google/common/util/concurrent/ServiceManager$ServiceListener.class */
    private static final class ServiceListener extends Service.Listener {

        @GuardedBy("watch")
        final Stopwatch watch = Stopwatch.createUnstarted();
        final Service service;
        final ServiceManagerState state;

        ServiceListener(Service service, ServiceManagerState state) {
            this.service = service;
            this.state = state;
        }

        @Override // com.google.common.util.concurrent.Service.Listener
        public void starting() {
            startTimer();
        }

        @Override // com.google.common.util.concurrent.Service.Listener
        public void running() {
            this.state.monitor.enter();
            try {
                finishedStarting(true);
                this.state.monitor.leave();
                this.state.executeListeners();
            } catch (Throwable th) {
                this.state.monitor.leave();
                this.state.executeListeners();
                throw th;
            }
        }

        @Override // com.google.common.util.concurrent.Service.Listener
        public void stopping(Service.State from) {
            if (from == Service.State.STARTING) {
                this.state.monitor.enter();
                try {
                    finishedStarting(false);
                    this.state.monitor.leave();
                    this.state.executeListeners();
                } catch (Throwable th) {
                    this.state.monitor.leave();
                    this.state.executeListeners();
                    throw th;
                }
            }
        }

        @Override // com.google.common.util.concurrent.Service.Listener
        public void terminated(Service.State from) {
            if (!(this.service instanceof NoOpService)) {
                ServiceManager.logger.log(Level.FINE, "Service {0} has terminated. Previous state was: {1}", new Object[]{this.service, from});
            }
            this.state.monitor.enter();
            try {
                if (from == Service.State.NEW) {
                    startTimer();
                    finishedStarting(false);
                }
                this.state.serviceTerminated(this.service);
                this.state.monitor.leave();
                this.state.executeListeners();
            } catch (Throwable th) {
                this.state.monitor.leave();
                this.state.executeListeners();
                throw th;
            }
        }

        @Override // com.google.common.util.concurrent.Service.Listener
        public void failed(Service.State from, Throwable failure) {
            ServiceManager.logger.log(Level.SEVERE, "Service " + this.service + " has failed in the " + from + " state.", failure);
            this.state.monitor.enter();
            try {
                if (from == Service.State.STARTING) {
                    finishedStarting(false);
                }
                this.state.serviceFailed(this.service);
                this.state.monitor.leave();
                this.state.executeListeners();
            } catch (Throwable th) {
                this.state.monitor.leave();
                this.state.executeListeners();
                throw th;
            }
        }

        @GuardedBy("monitor")
        void finishedStarting(boolean currentlyHealthy) {
            synchronized (this.watch) {
                this.watch.stop();
                if (!(this.service instanceof NoOpService)) {
                    ServiceManager.logger.log(Level.FINE, "Started {0} in {1} ms.", new Object[]{this.service, Long.valueOf(startupTimeMillis())});
                }
            }
            this.state.serviceFinishedStarting(this.service, currentlyHealthy);
        }

        void start() {
            startTimer();
            this.service.startAsync();
        }

        void startTimer() {
            synchronized (this.watch) {
                if (!this.watch.isRunning()) {
                    this.watch.start();
                    if (!(this.service instanceof NoOpService)) {
                        ServiceManager.logger.log(Level.FINE, "Starting {0}.", this.service);
                    }
                }
            }
        }

        long startupTimeMillis() {
            long elapsed;
            synchronized (this.watch) {
                elapsed = this.watch.elapsed(TimeUnit.MILLISECONDS);
            }
            return elapsed;
        }
    }

    @Immutable
    /* loaded from: guava-15.0.jar:com/google/common/util/concurrent/ServiceManager$ListenerExecutorPair.class */
    private static final class ListenerExecutorPair {
        final Listener listener;
        final Executor executor;

        ListenerExecutorPair(Listener listener, Executor executor) {
            this.listener = listener;
            this.executor = executor;
        }
    }

    /* loaded from: guava-15.0.jar:com/google/common/util/concurrent/ServiceManager$NoOpService.class */
    private static final class NoOpService extends AbstractService {
        private NoOpService() {
        }

        @Override // com.google.common.util.concurrent.AbstractService
        protected void doStart() {
            notifyStarted();
        }

        @Override // com.google.common.util.concurrent.AbstractService
        protected void doStop() {
            notifyStopped();
        }
    }

    /* loaded from: guava-15.0.jar:com/google/common/util/concurrent/ServiceManager$EmptyServiceManagerWarning.class */
    private static final class EmptyServiceManagerWarning extends Throwable {
        private EmptyServiceManagerWarning() {
        }
    }
}
