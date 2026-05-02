package com.facebook.stetho.dumpapp.plugins;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;
import com.facebook.stetho.BuildConfig;
import com.facebook.stetho.dumpapp.DumpUsageException;
import com.facebook.stetho.dumpapp.DumperContext;
import com.facebook.stetho.dumpapp.DumperPlugin;
import com.facebook.stetho.inspector.protocol.module.DatabaseConstants;
import com.facebook.stetho.websocket.Frame;
import java.io.File;
import java.io.PrintStream;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin.class */
public class SharedPreferencesDumperPlugin implements DumperPlugin {
    private static final String XML_SUFFIX = ".xml";
    private static final String NAME = "prefs";
    private final Context mAppContext;

    public SharedPreferencesDumperPlugin(Context context) {
        this.mAppContext = context.getApplicationContext();
    }

    @Override // com.facebook.stetho.dumpapp.DumperPlugin
    public String getName() {
        return NAME;
    }

    @Override // com.facebook.stetho.dumpapp.DumperPlugin
    public void dump(DumperContext dumpContext) throws DumpUsageException {
        PrintStream writer = dumpContext.getStdout();
        List<String> args = dumpContext.getArgsAsList();
        String commandName = args.isEmpty() ? BuildConfig.FLAVOR : args.remove(0);
        if (commandName.equals("print")) {
            doPrint(writer, args);
        } else if (commandName.equals("write")) {
            doWrite(args);
        } else {
            doUsage(writer);
        }
    }

    private void doWrite(List<String> args) throws DumpUsageException {
        Iterator<String> argsIter = args.iterator();
        String path = nextArg(argsIter, "Expected <path>");
        String key = nextArg(argsIter, "Expected <key>");
        String typeName = nextArg(argsIter, "Expected <type>");
        Type type = Type.of(typeName);
        if (type == null) {
            throw new DumpUsageException(Type.appendNamesList(new StringBuilder("Usage: prefs write <path> <key> <type> <value>, where type is one of: "), ", ").toString());
        }
        SharedPreferences sharedPreferences = getSharedPreferences(path);
        SharedPreferences.Editor editor = sharedPreferences.edit();
        switch (AnonymousClass1.$SwitchMap$com$facebook$stetho$dumpapp$plugins$SharedPreferencesDumperPlugin$Type[type.ordinal()]) {
            case 1:
                editor.putBoolean(key, Boolean.valueOf(nextArgValue(argsIter)).booleanValue());
                break;
            case Frame.OPCODE_BINARY_FRAME /* 2 */:
                editor.putInt(key, Integer.valueOf(nextArgValue(argsIter)).intValue());
                break;
            case 3:
                editor.putLong(key, Long.valueOf(nextArgValue(argsIter)).longValue());
                break;
            case 4:
                editor.putFloat(key, Float.valueOf(nextArgValue(argsIter)).floatValue());
                break;
            case 5:
                editor.putString(key, nextArgValue(argsIter));
                break;
            case 6:
                putStringSet(editor, key, argsIter);
                break;
        }
        editor.commit();
    }

    /* renamed from: com.facebook.stetho.dumpapp.plugins.SharedPreferencesDumperPlugin$1, reason: invalid class name */
    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$facebook$stetho$dumpapp$plugins$SharedPreferencesDumperPlugin$Type = new int[Type.values().length];

        static {
            try {
                $SwitchMap$com$facebook$stetho$dumpapp$plugins$SharedPreferencesDumperPlugin$Type[Type.BOOLEAN.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$facebook$stetho$dumpapp$plugins$SharedPreferencesDumperPlugin$Type[Type.INT.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$facebook$stetho$dumpapp$plugins$SharedPreferencesDumperPlugin$Type[Type.LONG.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$facebook$stetho$dumpapp$plugins$SharedPreferencesDumperPlugin$Type[Type.FLOAT.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$facebook$stetho$dumpapp$plugins$SharedPreferencesDumperPlugin$Type[Type.STRING.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$com$facebook$stetho$dumpapp$plugins$SharedPreferencesDumperPlugin$Type[Type.SET.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
        }
    }

    @Nonnull
    private static String nextArg(Iterator<String> iter, String messageIfNotPresent) throws DumpUsageException {
        if (!iter.hasNext()) {
            throw new DumpUsageException(messageIfNotPresent);
        }
        return iter.next();
    }

    @Nonnull
    private static String nextArgValue(Iterator<String> iter) throws DumpUsageException {
        return nextArg(iter, "Expected <value>");
    }

    @TargetApi(DatabaseConstants.MIN_API_LEVEL)
    private static void putStringSet(SharedPreferences.Editor editor, String key, Iterator<String> remainingArgs) {
        HashSet<String> set = new HashSet<>();
        while (remainingArgs.hasNext()) {
            set.add(remainingArgs.next());
        }
        editor.putStringSet(key, set);
    }

    private void doPrint(PrintStream writer, List<String> args) {
        String rootPath = this.mAppContext.getApplicationInfo().dataDir + "/shared_prefs";
        String offsetPrefix = args.isEmpty() ? BuildConfig.FLAVOR : args.get(0);
        String keyPrefix = args.size() > 1 ? args.get(1) : BuildConfig.FLAVOR;
        printRecursive(writer, rootPath, BuildConfig.FLAVOR, offsetPrefix, keyPrefix);
    }

    private void printRecursive(PrintStream writer, String rootPath, String offsetPath, String pathPrefix, String keyPrefix) {
        String[] children;
        File file = new File(rootPath, offsetPath);
        if (file.isFile()) {
            if (offsetPath.endsWith(XML_SUFFIX)) {
                int suffixLength = XML_SUFFIX.length();
                String prefsName = offsetPath.substring(0, offsetPath.length() - suffixLength);
                printFile(writer, prefsName, keyPrefix);
                return;
            }
            return;
        }
        if (file.isDirectory() && (children = file.list()) != null) {
            for (int i = 0; i < children.length; i++) {
                String childOffsetPath = TextUtils.isEmpty(offsetPath) ? children[i] : offsetPath + File.separator + children[i];
                if (childOffsetPath.startsWith(pathPrefix)) {
                    printRecursive(writer, rootPath, childOffsetPath, pathPrefix, keyPrefix);
                }
            }
        }
    }

    private void printFile(PrintStream writer, String prefsName, String keyPrefix) {
        writer.println(prefsName + ":");
        SharedPreferences preferences = getSharedPreferences(prefsName);
        for (Map.Entry<String, ?> entry : preferences.getAll().entrySet()) {
            if (entry.getKey().startsWith(keyPrefix)) {
                writer.println("  " + entry.getKey() + " = " + entry.getValue());
            }
        }
    }

    private void doUsage(PrintStream writer) {
        writer.println("Usage: dumpapp prefs <command> [command-options]");
        writer.println("Usage: dumpapp prefs print [pathPrefix [keyPrefix]]");
        writer.println(Type.appendNamesList(new StringBuilder("       dumpapp prefs ").append("write <path> <key> <"), "|").append("> <value>"));
        writer.println();
        writer.println("dumpapp prefs print: Print all matching values from the shared preferences");
        writer.println();
        writer.println("dumpapp prefs write: Writes a value to the shared preferences");
    }

    private SharedPreferences getSharedPreferences(String name) {
        return this.mAppContext.getSharedPreferences(name, 4);
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type.class */
    private enum Type {
        BOOLEAN("boolean"),
        INT("int"),
        LONG("long"),
        FLOAT("float"),
        STRING("string"),
        SET("set");

        private final String name;

        Type(String name) {
            this.name = name;
        }

        @Nullable
        public static Type of(String name) {
            for (Type type : values()) {
                if (type.name.equals(name)) {
                    return type;
                }
            }
            return null;
        }

        public static StringBuilder appendNamesList(StringBuilder builder, String separator) {
            boolean isFirst = true;
            for (Type type : values()) {
                if (isFirst) {
                    isFirst = false;
                } else {
                    builder.append(separator);
                }
                builder.append(type.name);
            }
            return builder;
        }
    }
}
