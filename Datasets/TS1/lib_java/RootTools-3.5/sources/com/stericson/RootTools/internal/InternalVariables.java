package com.stericson.RootTools.internal;

import com.stericson.RootTools.containers.Mount;
import com.stericson.RootTools.containers.Permissions;
import com.stericson.RootTools.containers.Symlink;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.regex.Pattern;

/* loaded from: RootTools-3.5.jar:com/stericson/RootTools/internal/InternalVariables.class */
public class InternalVariables {
    protected static String[] space;
    protected static String getSpaceFor;
    protected static String busyboxVersion;
    protected static Set<String> path;
    protected static ArrayList<Mount> mounts;
    protected static ArrayList<Symlink> symlinks;
    protected static List<String> results;
    protected static Permissions permissions;
    protected static boolean accessGiven = false;
    protected static boolean nativeToolsReady = false;
    protected static boolean found = false;
    protected static boolean processRunning = false;
    protected static String pid_list = "";
    protected static String inode = "";
    protected static final String PS_REGEX = "^\\S+\\s+([0-9]+).*$";
    protected static Pattern psPattern = Pattern.compile(PS_REGEX);
}
