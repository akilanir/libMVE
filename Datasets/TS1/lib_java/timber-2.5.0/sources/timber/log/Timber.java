package timber.log;

import android.util.Log;
import android.util.SparseBooleanArray;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: timber-2.5.0.jar:timber/log/Timber.class */
public final class Timber {
    static final List<Tree> FOREST = new CopyOnWriteArrayList();
    static final SparseBooleanArray TAGGED_TREES = new SparseBooleanArray();
    private static final Tree TREE_OF_SOULS = new Tree() { // from class: timber.log.Timber.1
        @Override // timber.log.Timber.Tree
        public void v(String message, Object... args) {
            List<Tree> forest = Timber.FOREST;
            int count = forest.size();
            for (int i = 0; i < count; i++) {
                forest.get(i).v(message, args);
            }
        }

        @Override // timber.log.Timber.Tree
        public void v(Throwable t, String message, Object... args) {
            List<Tree> forest = Timber.FOREST;
            int count = forest.size();
            for (int i = 0; i < count; i++) {
                forest.get(i).v(t, message, args);
            }
        }

        @Override // timber.log.Timber.Tree
        public void d(String message, Object... args) {
            List<Tree> forest = Timber.FOREST;
            int count = forest.size();
            for (int i = 0; i < count; i++) {
                forest.get(i).d(message, args);
            }
        }

        @Override // timber.log.Timber.Tree
        public void d(Throwable t, String message, Object... args) {
            List<Tree> forest = Timber.FOREST;
            int count = forest.size();
            for (int i = 0; i < count; i++) {
                forest.get(i).d(t, message, args);
            }
        }

        @Override // timber.log.Timber.Tree
        public void i(String message, Object... args) {
            List<Tree> forest = Timber.FOREST;
            int count = forest.size();
            for (int i = 0; i < count; i++) {
                forest.get(i).i(message, args);
            }
        }

        @Override // timber.log.Timber.Tree
        public void i(Throwable t, String message, Object... args) {
            List<Tree> forest = Timber.FOREST;
            int count = forest.size();
            for (int i = 0; i < count; i++) {
                forest.get(i).i(t, message, args);
            }
        }

        @Override // timber.log.Timber.Tree
        public void w(String message, Object... args) {
            List<Tree> forest = Timber.FOREST;
            int count = forest.size();
            for (int i = 0; i < count; i++) {
                forest.get(i).w(message, args);
            }
        }

        @Override // timber.log.Timber.Tree
        public void w(Throwable t, String message, Object... args) {
            List<Tree> forest = Timber.FOREST;
            int count = forest.size();
            for (int i = 0; i < count; i++) {
                forest.get(i).w(t, message, args);
            }
        }

        @Override // timber.log.Timber.Tree
        public void e(String message, Object... args) {
            List<Tree> forest = Timber.FOREST;
            int count = forest.size();
            for (int i = 0; i < count; i++) {
                forest.get(i).e(message, args);
            }
        }

        @Override // timber.log.Timber.Tree
        public void e(Throwable t, String message, Object... args) {
            List<Tree> forest = Timber.FOREST;
            int count = forest.size();
            for (int i = 0; i < count; i++) {
                forest.get(i).e(t, message, args);
            }
        }
    };

    /* loaded from: timber-2.5.0.jar:timber/log/Timber$TaggedTree.class */
    public interface TaggedTree extends Tree {
        void tag(String str);
    }

    /* loaded from: timber-2.5.0.jar:timber/log/Timber$Tree.class */
    public interface Tree {
        void v(String str, Object... objArr);

        void v(Throwable th, String str, Object... objArr);

        void d(String str, Object... objArr);

        void d(Throwable th, String str, Object... objArr);

        void i(String str, Object... objArr);

        void i(Throwable th, String str, Object... objArr);

        void w(String str, Object... objArr);

        void w(Throwable th, String str, Object... objArr);

        void e(String str, Object... objArr);

        void e(Throwable th, String str, Object... objArr);
    }

    public static void v(String message, Object... args) {
        TREE_OF_SOULS.v(message, args);
    }

    public static void v(Throwable t, String message, Object... args) {
        TREE_OF_SOULS.v(t, message, args);
    }

    public static void d(String message, Object... args) {
        TREE_OF_SOULS.d(message, args);
    }

    public static void d(Throwable t, String message, Object... args) {
        TREE_OF_SOULS.d(t, message, args);
    }

    public static void i(String message, Object... args) {
        TREE_OF_SOULS.i(message, args);
    }

    public static void i(Throwable t, String message, Object... args) {
        TREE_OF_SOULS.i(t, message, args);
    }

    public static void w(String message, Object... args) {
        TREE_OF_SOULS.w(message, args);
    }

    public static void w(Throwable t, String message, Object... args) {
        TREE_OF_SOULS.w(t, message, args);
    }

    public static void e(String message, Object... args) {
        TREE_OF_SOULS.e(message, args);
    }

    public static void e(Throwable t, String message, Object... args) {
        TREE_OF_SOULS.e(t, message, args);
    }

    public static Tree asTree() {
        return TREE_OF_SOULS;
    }

    public static Tree tag(String tag) {
        int size = TAGGED_TREES.size();
        for (int index = 0; index < size; index++) {
            ((TaggedTree) FOREST.get(TAGGED_TREES.keyAt(index))).tag(tag);
        }
        return TREE_OF_SOULS;
    }

    public static void plant(Tree tree) {
        if (tree == TREE_OF_SOULS) {
            throw new IllegalArgumentException("Cannot plant Timber into itself.");
        }
        if (tree instanceof TaggedTree) {
            TAGGED_TREES.append(FOREST.size(), true);
        }
        FOREST.add(tree);
    }

    public static void uproot(Tree tree) {
        int size = FOREST.size();
        for (int i = 0; i < size; i++) {
            if (FOREST.get(i) == tree) {
                TAGGED_TREES.delete(i);
                FOREST.remove(i);
                return;
            }
        }
        throw new IllegalArgumentException("Cannot uproot tree which is not planted: " + tree);
    }

    public static void uprootAll() {
        TAGGED_TREES.clear();
        FOREST.clear();
    }

    private Timber() {
    }

    /* loaded from: timber-2.5.0.jar:timber/log/Timber$DebugTree.class */
    public static class DebugTree implements TaggedTree {
        private static final Pattern ANONYMOUS_CLASS = Pattern.compile("\\$\\d+$");
        private static final ThreadLocal<String> NEXT_TAG = new ThreadLocal<>();

        private static String createTag() {
            String tag = NEXT_TAG.get();
            if (tag != null) {
                NEXT_TAG.remove();
                return tag;
            }
            StackTraceElement[] stackTrace = new Throwable().getStackTrace();
            if (stackTrace.length < 6) {
                throw new IllegalStateException("Synthetic stacktrace didn't have enough elements: are you using proguard?");
            }
            String tag2 = stackTrace[5].getClassName();
            Matcher m = ANONYMOUS_CLASS.matcher(tag2);
            if (m.find()) {
                tag2 = m.replaceAll("");
            }
            return tag2.substring(tag2.lastIndexOf(46) + 1);
        }

        static String formatString(String message, Object... args) {
            return args.length == 0 ? message : String.format(message, args);
        }

        @Override // timber.log.Timber.Tree
        public void v(String message, Object... args) {
            throwShade(2, formatString(message, args), null);
        }

        @Override // timber.log.Timber.Tree
        public void v(Throwable t, String message, Object... args) {
            throwShade(2, formatString(message, args), t);
        }

        @Override // timber.log.Timber.Tree
        public void d(String message, Object... args) {
            throwShade(3, formatString(message, args), null);
        }

        @Override // timber.log.Timber.Tree
        public void d(Throwable t, String message, Object... args) {
            throwShade(3, formatString(message, args), t);
        }

        @Override // timber.log.Timber.Tree
        public void i(String message, Object... args) {
            throwShade(4, formatString(message, args), null);
        }

        @Override // timber.log.Timber.Tree
        public void i(Throwable t, String message, Object... args) {
            throwShade(4, formatString(message, args), t);
        }

        @Override // timber.log.Timber.Tree
        public void w(String message, Object... args) {
            throwShade(5, formatString(message, args), null);
        }

        @Override // timber.log.Timber.Tree
        public void w(Throwable t, String message, Object... args) {
            throwShade(5, formatString(message, args), t);
        }

        @Override // timber.log.Timber.Tree
        public void e(String message, Object... args) {
            throwShade(6, formatString(message, args), null);
        }

        @Override // timber.log.Timber.Tree
        public void e(Throwable t, String message, Object... args) {
            throwShade(6, formatString(message, args), t);
        }

        private void throwShade(int priority, String message, Throwable t) {
            if (message == null || message.length() == 0) {
                if (t != null) {
                    message = Log.getStackTraceString(t);
                } else {
                    return;
                }
            } else if (t != null) {
                message = message + "\n" + Log.getStackTraceString(t);
            }
            String tag = createTag();
            if (message.length() < 4000) {
                Log.println(priority, tag, message);
                return;
            }
            String[] lines = message.split("\n");
            for (String line : lines) {
                Log.println(priority, tag, line);
            }
        }

        @Override // timber.log.Timber.TaggedTree
        public void tag(String tag) {
            NEXT_TAG.set(tag);
        }
    }

    /* loaded from: timber-2.5.0.jar:timber/log/Timber$HollowTree.class */
    public static class HollowTree implements Tree {
        @Override // timber.log.Timber.Tree
        public void v(String message, Object... args) {
        }

        @Override // timber.log.Timber.Tree
        public void v(Throwable t, String message, Object... args) {
        }

        @Override // timber.log.Timber.Tree
        public void d(String message, Object... args) {
        }

        @Override // timber.log.Timber.Tree
        public void d(Throwable t, String message, Object... args) {
        }

        @Override // timber.log.Timber.Tree
        public void i(String message, Object... args) {
        }

        @Override // timber.log.Timber.Tree
        public void i(Throwable t, String message, Object... args) {
        }

        @Override // timber.log.Timber.Tree
        public void w(String message, Object... args) {
        }

        @Override // timber.log.Timber.Tree
        public void w(Throwable t, String message, Object... args) {
        }

        @Override // timber.log.Timber.Tree
        public void e(String message, Object... args) {
        }

        @Override // timber.log.Timber.Tree
        public void e(Throwable t, String message, Object... args) {
        }
    }
}
