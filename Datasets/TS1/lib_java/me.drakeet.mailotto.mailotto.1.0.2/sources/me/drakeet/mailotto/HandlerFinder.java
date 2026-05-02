package me.drakeet.mailotto;

/* loaded from: me.drakeet.mailotto.mailotto.1.0.2.jar:me/drakeet/mailotto/HandlerFinder.class */
interface HandlerFinder {
    public static final HandlerFinder ANNOTATED = new HandlerFinder() { // from class: me.drakeet.mailotto.HandlerFinder.1
        @Override // me.drakeet.mailotto.HandlerFinder
        public MailHandler findOnMailReceived(Object listener) {
            return AnnotatedHandlerFinder.findOnMailReceived(listener);
        }
    };

    MailHandler findOnMailReceived(Object obj);
}
