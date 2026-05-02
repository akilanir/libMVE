package com.stericson.RootTools.internal;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Environment;
import android.os.StatFs;
import android.util.Log;
import com.stericson.RootTools.Constants;
import com.stericson.RootTools.RootTools;
import com.stericson.RootTools.containers.Mount;
import com.stericson.RootTools.containers.Permissions;
import com.stericson.RootTools.containers.Symlink;
import com.stericson.RootTools.execution.Command;
import com.stericson.RootTools.execution.CommandCapture;
import com.stericson.RootTools.execution.Shell;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.LineNumberReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;

/* loaded from: RootTools-3.5.jar:com/stericson/RootTools/internal/RootToolsInternalMethods.class */
public final class RootToolsInternalMethods {
    protected RootToolsInternalMethods() {
    }

    public static void getInstance() {
        RootTools.setRim(new RootToolsInternalMethods());
    }

    public ArrayList<Symlink> getSymLinks() throws IOException {
        LineNumberReader lnr = null;
        FileReader fr = null;
        try {
            fr = new FileReader("/data/local/symlinks.txt");
            lnr = new LineNumberReader(fr);
            ArrayList<Symlink> symlink = new ArrayList<>();
            while (true) {
                String line = lnr.readLine();
                if (line == null) {
                    break;
                }
                RootTools.log(line);
                String[] fields = line.split(" ");
                symlink.add(new Symlink(new File(fields[fields.length - 3]), new File(fields[fields.length - 1])));
            }
            try {
                fr.close();
            } catch (Exception e) {
            }
            try {
                lnr.close();
            } catch (Exception e2) {
            }
            return symlink;
        } catch (Throwable th) {
            try {
                fr.close();
            } catch (Exception e3) {
            }
            try {
                lnr.close();
            } catch (Exception e4) {
            }
            throw th;
        }
    }

    public Permissions getPermissions(String line) {
        String[] lineArray = line.split(" ");
        String rawPermissions = lineArray[0];
        if (rawPermissions.length() != 10) {
            return null;
        }
        if (rawPermissions.charAt(0) != '-' && rawPermissions.charAt(0) != 'd' && rawPermissions.charAt(0) != 'l') {
            return null;
        }
        if (rawPermissions.charAt(1) != '-' && rawPermissions.charAt(1) != 'r') {
            return null;
        }
        if (rawPermissions.charAt(2) == '-' || rawPermissions.charAt(2) == 'w') {
            RootTools.log(rawPermissions);
            Permissions permissions = new Permissions();
            permissions.setType(rawPermissions.substring(0, 1));
            RootTools.log(permissions.getType());
            permissions.setUserPermissions(rawPermissions.substring(1, 4));
            RootTools.log(permissions.getUserPermissions());
            permissions.setGroupPermissions(rawPermissions.substring(4, 7));
            RootTools.log(permissions.getGroupPermissions());
            permissions.setOtherPermissions(rawPermissions.substring(7, 10));
            RootTools.log(permissions.getOtherPermissions());
            StringBuilder finalPermissions = new StringBuilder();
            finalPermissions.append(parseSpecialPermissions(rawPermissions));
            finalPermissions.append(parsePermissions(permissions.getUserPermissions()));
            finalPermissions.append(parsePermissions(permissions.getGroupPermissions()));
            finalPermissions.append(parsePermissions(permissions.getOtherPermissions()));
            permissions.setPermissions(Integer.parseInt(finalPermissions.toString()));
            return permissions;
        }
        return null;
    }

    public int parsePermissions(String permission) {
        int tmp;
        int tmp2;
        int tmp3;
        if (permission.charAt(0) == 'r') {
            tmp = 4;
        } else {
            tmp = 0;
        }
        RootTools.log("permission " + tmp);
        RootTools.log("character " + permission.charAt(0));
        if (permission.charAt(1) == 'w') {
            tmp2 = tmp + 2;
        } else {
            tmp2 = tmp + 0;
        }
        RootTools.log("permission " + tmp2);
        RootTools.log("character " + permission.charAt(1));
        if (permission.charAt(2) == 'x') {
            tmp3 = tmp2 + 1;
        } else {
            tmp3 = tmp2 + 0;
        }
        RootTools.log("permission " + tmp3);
        RootTools.log("character " + permission.charAt(2));
        return tmp3;
    }

    public int parseSpecialPermissions(String permission) {
        int tmp = 0;
        if (permission.charAt(2) == 's') {
            tmp = 0 + 4;
        }
        if (permission.charAt(5) == 's') {
            tmp += 2;
        }
        if (permission.charAt(8) == 't') {
            tmp++;
        }
        RootTools.log("special permissions " + tmp);
        return tmp;
    }

    public boolean copyFile(String source, String destination, boolean remountAsRw, boolean preserveFileAttributes) {
        CommandCapture command = null;
        boolean result = true;
        if (remountAsRw) {
            try {
                RootTools.remount(destination, "RW");
            } catch (Exception e) {
                e.printStackTrace();
                result = false;
            }
        }
        if (checkUtil("cp")) {
            RootTools.log("cp command is available!");
            if (preserveFileAttributes) {
                command = new CommandCapture(0, false, "cp -fp " + source + " " + destination);
                Shell.startRootShell().add(command);
                commandWait(Shell.startRootShell(), command);
                result = command.getExitCode() == 0;
            } else {
                command = new CommandCapture(0, false, "cp -f " + source + " " + destination);
                Shell.startRootShell().add(command);
                commandWait(Shell.startRootShell(), command);
                result = command.getExitCode() == 0;
            }
        } else if (checkUtil("busybox") && hasUtil("cp", "busybox")) {
            RootTools.log("busybox cp command is available!");
            if (preserveFileAttributes) {
                command = new CommandCapture(0, false, "busybox cp -fp " + source + " " + destination);
                Shell.startRootShell().add(command);
                commandWait(Shell.startRootShell(), command);
            } else {
                command = new CommandCapture(0, false, "busybox cp -f " + source + " " + destination);
                Shell.startRootShell().add(command);
                commandWait(Shell.startRootShell(), command);
            }
        } else if (checkUtil("cat")) {
            RootTools.log("cp is not available, use cat!");
            int filePermission = -1;
            if (preserveFileAttributes) {
                Permissions permissions = getFilePermissionsSymlinks(source);
                filePermission = permissions.getPermissions();
            }
            command = new CommandCapture(0, false, "cat " + source + " > " + destination);
            Shell.startRootShell().add(command);
            commandWait(Shell.startRootShell(), command);
            if (preserveFileAttributes) {
                command = new CommandCapture(0, false, "chmod " + filePermission + " " + destination);
                Shell.startRootShell().add(command);
                commandWait(Shell.startRootShell(), command);
            }
        } else {
            result = false;
        }
        if (remountAsRw) {
            RootTools.remount(destination, "RO");
        }
        if (command != null) {
            result = command.getExitCode() == 0;
        }
        return result;
    }

    public boolean checkUtil(String util) {
        String permission;
        if (RootTools.findBinary(util)) {
            List<String> binaryPaths = new ArrayList<>();
            binaryPaths.addAll(RootTools.lastFoundBinaryPaths);
            for (String path : binaryPaths) {
                Permissions permissions = RootTools.getFilePermissionsSymlinks(path + "/" + util);
                if (permissions != null) {
                    if (Integer.toString(permissions.getPermissions()).length() > 3) {
                        permission = Integer.toString(permissions.getPermissions()).substring(1);
                    } else {
                        permission = Integer.toString(permissions.getPermissions());
                    }
                    if (permission.equals("755") || permission.equals("777") || permission.equals("775")) {
                        RootTools.utilPath = path + "/" + util;
                        return true;
                    }
                }
            }
            return false;
        }
        return false;
    }

    public boolean deleteFileOrDirectory(String target, boolean remountAsRw) {
        boolean result = true;
        if (remountAsRw) {
            try {
                RootTools.remount(target, "RW");
            } catch (Exception e) {
                e.printStackTrace();
                result = false;
            }
        }
        if (hasUtil("rm", "toolbox")) {
            RootTools.log("rm command is available!");
            CommandCapture command = new CommandCapture(0, false, "rm -r " + target);
            Shell.startRootShell().add(command);
            commandWait(Shell.startRootShell(), command);
            if (command.getExitCode() != 0) {
                RootTools.log("target not exist or unable to delete file");
                result = false;
            }
        } else if (checkUtil("busybox") && hasUtil("rm", "busybox")) {
            RootTools.log("busybox rm command is available!");
            CommandCapture command2 = new CommandCapture(0, false, "busybox rm -rf " + target);
            Shell.startRootShell().add(command2);
            commandWait(Shell.startRootShell(), command2);
            if (command2.getExitCode() != 0) {
                RootTools.log("target not exist or unable to delete file");
                result = false;
            }
        }
        if (remountAsRw) {
            RootTools.remount(target, "RO");
        }
        return result;
    }

    public boolean exists(String file) {
        return exists(file, false);
    }

    public boolean exists(String file, boolean isDir) {
        final ArrayList<String> arrayList = new ArrayList();
        String cmdToExecute = "ls " + (isDir ? "-d " : " ");
        CommandCapture command = new CommandCapture(0, false, new String[]{cmdToExecute + file}) { // from class: com.stericson.RootTools.internal.RootToolsInternalMethods.1
            @Override // com.stericson.RootTools.execution.Command
            public void output(int arg0, String arg1) {
                RootTools.log(arg1);
                arrayList.add(arg1);
            }
        };
        try {
            Shell.startShell().add(command);
            commandWait(Shell.startShell(), command);
            for (String line : arrayList) {
                if (line.trim().equals(file)) {
                    return true;
                }
            }
            try {
                RootTools.closeShell(false);
            } catch (Exception e) {
            }
            arrayList.clear();
            try {
                Shell.startRootShell().add(command);
                commandWait(Shell.startRootShell(), command);
                List<String> final_result = new ArrayList<>();
                final_result.addAll(arrayList);
                for (String line2 : final_result) {
                    if (line2.trim().equals(file)) {
                        return true;
                    }
                }
                return false;
            } catch (Exception e2) {
                return false;
            }
        } catch (Exception e3) {
            return false;
        }
    }

    public void fixUtil(String util, String utilPath) {
        try {
            RootTools.remount("/system", "rw");
            if (RootTools.findBinary(util)) {
                List<String> paths = new ArrayList<>();
                paths.addAll(RootTools.lastFoundBinaryPaths);
                for (String path : paths) {
                    CommandCapture command = new CommandCapture(0, false, utilPath + " rm " + path + "/" + util);
                    Shell.startRootShell().add(command);
                    commandWait(Shell.startRootShell(), command);
                }
                CommandCapture command2 = new CommandCapture(0, false, utilPath + " ln -s " + utilPath + " /system/bin/" + util, utilPath + " chmod 0755 /system/bin/" + util);
                Shell.startRootShell().add(command2);
                commandWait(Shell.startRootShell(), command2);
            }
            RootTools.remount("/system", "ro");
        } catch (Exception e) {
        }
    }

    public boolean fixUtils(String[] utils) throws Exception {
        for (String util : utils) {
            if (!checkUtil(util)) {
                if (checkUtil("busybox")) {
                    if (hasUtil(util, "busybox")) {
                        fixUtil(util, RootTools.utilPath);
                    }
                } else if (checkUtil("toolbox")) {
                    if (hasUtil(util, "toolbox")) {
                        fixUtil(util, RootTools.utilPath);
                    }
                } else {
                    return false;
                }
            }
        }
        return true;
    }

    public boolean findBinary(final String binaryName) {
        boolean found = false;
        RootTools.lastFoundBinaryPaths.clear();
        final List<String> list = new ArrayList<>();
        String[] places = {"/sbin/", "/system/bin/", "/system/xbin/", "/data/local/xbin/", "/data/local/bin/", "/system/sd/xbin/", "/system/bin/failsafe/", "/data/local/"};
        RootTools.log("Checking for " + binaryName);
        try {
            for (final String path : places) {
                CommandCapture cc = new CommandCapture(0, false, new String[]{"stat " + path + binaryName}) { // from class: com.stericson.RootTools.internal.RootToolsInternalMethods.2
                    @Override // com.stericson.RootTools.execution.CommandCapture, com.stericson.RootTools.execution.Command
                    public void commandOutput(int id, String line) {
                        if (line.contains("File: ") && line.contains(binaryName)) {
                            list.add(path);
                            RootTools.log(binaryName + " was found here: " + path);
                        }
                        RootTools.log(line);
                    }
                };
                RootTools.getShell(false).add(cc);
                commandWait(RootTools.getShell(false), cc);
            }
            found = !list.isEmpty();
        } catch (Exception e) {
            RootTools.log(binaryName + " was not found, more information MAY be available with Debugging on.");
        }
        if (!found) {
            RootTools.log("Trying second method");
            for (String where : places) {
                if (RootTools.exists(where + binaryName)) {
                    RootTools.log(binaryName + " was found here: " + where);
                    list.add(where);
                    found = true;
                } else {
                    RootTools.log(binaryName + " was NOT found here: " + where);
                }
            }
        }
        if (!found) {
            RootTools.log("Trying third method");
            try {
                List<String> paths = RootTools.getPath();
                if (paths != null) {
                    for (String path2 : paths) {
                        if (RootTools.exists(path2 + "/" + binaryName)) {
                            RootTools.log(binaryName + " was found here: " + path2);
                            list.add(path2);
                            found = true;
                        } else {
                            RootTools.log(binaryName + " was NOT found here: " + path2);
                        }
                    }
                }
            } catch (Exception e2) {
                RootTools.log(binaryName + " was not found, more information MAY be available with Debugging on.");
            }
        }
        Collections.reverse(list);
        RootTools.lastFoundBinaryPaths.addAll(list);
        return found;
    }

    public List<String> getBusyBoxApplets(String path) throws Exception {
        if (path != null && !path.endsWith("/") && !path.equals("")) {
            path = path + "/";
        } else if (path == null) {
            throw new Exception("Path is null, please specifiy a path");
        }
        final List<String> results = new ArrayList<>();
        CommandCapture command = new CommandCapture(3, false, new String[]{path + "busybox --list"}) { // from class: com.stericson.RootTools.internal.RootToolsInternalMethods.3
            @Override // com.stericson.RootTools.execution.Command
            public void output(int id, String line) {
                if (id == 3 && !line.trim().equals("") && !line.trim().contains("not found")) {
                    results.add(line);
                }
            }
        };
        Shell.startShell().add(command);
        commandWait(Shell.startShell(), command);
        if (results.size() <= 0) {
            Shell.startRootShell().add(command);
            commandWait(Shell.startRootShell(), command);
        }
        return results;
    }

    public String getBusyBoxVersion(String path) {
        if (!path.equals("") && !path.endsWith("/")) {
            path = path + "/";
        }
        InternalVariables.busyboxVersion = "";
        try {
            CommandCapture command = new CommandCapture(4, false, path + "busybox") { // from class: com.stericson.RootTools.internal.RootToolsInternalMethods.4
                @Override // com.stericson.RootTools.execution.Command
                public void output(int id, String line) {
                    if (id == 4 && line.startsWith("BusyBox") && InternalVariables.busyboxVersion.equals("")) {
                        String[] temp = line.split(" ");
                        InternalVariables.busyboxVersion = temp[1];
                    }
                }
            };
            RootTools.log("Getting BusyBox Version without root");
            Shell.startShell().add(command);
            commandWait(Shell.startShell(), command);
            if (InternalVariables.busyboxVersion.length() <= 0) {
                RootTools.log("Getting BusyBox Version with root");
                Shell.startRootShell().add(command);
                commandWait(Shell.startRootShell(), command);
            }
            return InternalVariables.busyboxVersion;
        } catch (Exception e) {
            RootTools.log("BusyBox was not found, more information MAY be available with Debugging on.");
            return "";
        }
    }

    public long getConvertedSpace(String spaceStr) {
        try {
            double multiplier = 1.0d;
            StringBuffer sb = new StringBuffer();
            int i = 0;
            while (true) {
                if (i >= spaceStr.length()) {
                    break;
                }
                char c = spaceStr.charAt(i);
                if (!Character.isDigit(c) && c != '.') {
                    if (c == 'm' || c == 'M') {
                        multiplier = 1024.0d;
                    } else if (c == 'g' || c == 'G') {
                        multiplier = 1048576.0d;
                    }
                } else {
                    sb.append(spaceStr.charAt(i));
                    i++;
                }
            }
            return (long) Math.ceil(Double.valueOf(sb.toString()).doubleValue() * multiplier);
        } catch (Exception e) {
            return -1L;
        }
    }

    public String getInode(String file) {
        try {
            CommandCapture command = new CommandCapture(5, false, "/data/local/ls -i " + file) { // from class: com.stericson.RootTools.internal.RootToolsInternalMethods.5
                @Override // com.stericson.RootTools.execution.Command
                public void output(int id, String line) {
                    if (id == 5 && !line.trim().equals("") && Character.isDigit(line.trim().substring(0, 1).toCharArray()[0])) {
                        InternalVariables.inode = line.trim().split(" ")[0];
                    }
                }
            };
            Shell.startRootShell().add(command);
            commandWait(Shell.startRootShell(), command);
            return InternalVariables.inode;
        } catch (Exception e) {
            return "";
        }
    }

    public boolean isAccessGiven() {
        try {
            RootTools.log("Checking for Root access");
            InternalVariables.accessGiven = false;
            CommandCapture command = new CommandCapture(2, false, "id") { // from class: com.stericson.RootTools.internal.RootToolsInternalMethods.6
                @Override // com.stericson.RootTools.execution.Command
                public void output(int id, String line) {
                    if (id == 2) {
                        Set<String> ID = new HashSet<>(Arrays.asList(line.split(" ")));
                        Iterator i$ = ID.iterator();
                        while (true) {
                            if (!i$.hasNext()) {
                                break;
                            }
                            String userid = i$.next();
                            RootTools.log(userid);
                            if (userid.toLowerCase().contains("uid=0")) {
                                InternalVariables.accessGiven = true;
                                RootTools.log("Access Given");
                                break;
                            }
                        }
                        if (!InternalVariables.accessGiven) {
                            RootTools.log("Access Denied?");
                        }
                    }
                }
            };
            Shell.startRootShell().add(command);
            commandWait(Shell.startRootShell(), command);
            return InternalVariables.accessGiven;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean isNativeToolsReady(int nativeToolsId, Context context) {
        RootTools.log("Preparing Native Tools");
        InternalVariables.nativeToolsReady = false;
        try {
            Installer installer = new Installer(context);
            if (installer.isBinaryInstalled("nativetools")) {
                InternalVariables.nativeToolsReady = true;
            } else {
                InternalVariables.nativeToolsReady = installer.installBinary(nativeToolsId, "nativetools", "700");
            }
            return InternalVariables.nativeToolsReady;
        } catch (IOException ex) {
            if (RootTools.debugMode) {
                ex.printStackTrace();
                return false;
            }
            return false;
        }
    }

    public Permissions getFilePermissionsSymlinks(String file) {
        RootTools.log("Checking permissions for " + file);
        if (RootTools.exists(file)) {
            RootTools.log(file + " was found.");
            try {
                CommandCapture command = new CommandCapture(1, false, "ls -l " + file, "busybox ls -l " + file, "/system/bin/failsafe/toolbox ls -l " + file, "toolbox ls -l " + file) { // from class: com.stericson.RootTools.internal.RootToolsInternalMethods.7
                    @Override // com.stericson.RootTools.execution.Command
                    public void output(int id, String line) {
                        if (id == 1) {
                            String symlink_final = "";
                            String[] lineArray = line.split(" ");
                            if (lineArray[0].length() != 10) {
                                return;
                            }
                            RootTools.log("Line " + line);
                            try {
                                String[] symlink = line.split(" ");
                                if (symlink[symlink.length - 2].equals("->")) {
                                    RootTools.log("Symlink found.");
                                    symlink_final = symlink[symlink.length - 1];
                                }
                            } catch (Exception e) {
                            }
                            try {
                                InternalVariables.permissions = RootToolsInternalMethods.this.getPermissions(line);
                                if (InternalVariables.permissions != null) {
                                    InternalVariables.permissions.setSymlink(symlink_final);
                                }
                            } catch (Exception e2) {
                                RootTools.log(e2.getMessage());
                            }
                        }
                    }
                };
                Shell.startRootShell().add(command);
                commandWait(Shell.startRootShell(), command);
                return InternalVariables.permissions;
            } catch (Exception e) {
                RootTools.log(e.getMessage());
                return null;
            }
        }
        return null;
    }

    public ArrayList<Mount> getMounts() throws Exception {
        Shell shell = RootTools.getShell(true);
        CommandCapture cmd = new CommandCapture(0, false, "cat /proc/mounts > /data/local/RootToolsMounts", "chmod 0777 /data/local/RootToolsMounts");
        shell.add(cmd);
        commandWait(shell, cmd);
        LineNumberReader lnr = null;
        FileReader fr = null;
        try {
            fr = new FileReader("/data/local/RootToolsMounts");
            lnr = new LineNumberReader(fr);
            ArrayList<Mount> mounts = new ArrayList<>();
            while (true) {
                String line = lnr.readLine();
                if (line == null) {
                    break;
                }
                RootTools.log(line);
                String[] fields = line.split(" ");
                mounts.add(new Mount(new File(fields[0]), new File(fields[1]), fields[2], fields[3]));
            }
            InternalVariables.mounts = mounts;
            if (InternalVariables.mounts != null) {
                return InternalVariables.mounts;
            }
            throw new Exception();
        } finally {
            try {
                fr.close();
            } catch (Exception e) {
            }
            try {
                lnr.close();
            } catch (Exception e2) {
            }
        }
    }

    public String getMountedAs(String path) throws Exception {
        InternalVariables.mounts = getMounts();
        if (InternalVariables.mounts != null) {
            Iterator i$ = InternalVariables.mounts.iterator();
            while (i$.hasNext()) {
                Mount mount = i$.next();
                String mp = mount.getMountPoint().getAbsolutePath();
                if (mp.equals("/")) {
                    if (path.equals("/")) {
                        return (String) mount.getFlags().toArray()[0];
                    }
                } else if (path.equals(mp) || path.startsWith(mp + "/")) {
                    RootTools.log((String) mount.getFlags().toArray()[0]);
                    return (String) mount.getFlags().toArray()[0];
                }
            }
            throw new Exception();
        }
        throw new Exception();
    }

    public long getSpace(String path) {
        InternalVariables.getSpaceFor = path;
        boolean found = false;
        RootTools.log("Looking for Space");
        try {
            CommandCapture command = new CommandCapture(6, false, "df " + path) { // from class: com.stericson.RootTools.internal.RootToolsInternalMethods.8
                @Override // com.stericson.RootTools.execution.Command
                public void output(int id, String line) {
                    if (id == 6 && line.contains(InternalVariables.getSpaceFor.trim())) {
                        InternalVariables.space = line.split(" ");
                    }
                }
            };
            Shell.startRootShell().add(command);
            commandWait(Shell.startRootShell(), command);
        } catch (Exception e) {
        }
        if (InternalVariables.space != null) {
            RootTools.log("First Method");
            String[] arr$ = InternalVariables.space;
            for (String spaceSearch : arr$) {
                RootTools.log(spaceSearch);
                if (found) {
                    return getConvertedSpace(spaceSearch);
                }
                if (spaceSearch.equals("used,")) {
                    found = true;
                }
            }
            int count = 0;
            RootTools.log("Second Method");
            int targetCount = InternalVariables.space[0].length() <= 5 ? 2 : 3;
            String[] arr$2 = InternalVariables.space;
            for (String spaceSearch2 : arr$2) {
                RootTools.log(spaceSearch2);
                if (spaceSearch2.length() > 0) {
                    RootTools.log(spaceSearch2 + "Valid");
                    if (count == targetCount) {
                        return getConvertedSpace(spaceSearch2);
                    }
                    count++;
                }
            }
        }
        RootTools.log("Returning -1, space could not be determined.");
        return -1L;
    }

    public String getSymlink(String file) {
        String final_symlink;
        RootTools.log("Looking for Symlink for " + file);
        try {
            final List<String> results = new ArrayList<>();
            CommandCapture command = new CommandCapture(7, false, new String[]{"ls -l " + file}) { // from class: com.stericson.RootTools.internal.RootToolsInternalMethods.9
                @Override // com.stericson.RootTools.execution.Command
                public void output(int id, String line) {
                    if (id == 7 && !line.trim().equals("")) {
                        results.add(line);
                    }
                }
            };
            Shell.startRootShell().add(command);
            commandWait(Shell.startRootShell(), command);
            String[] symlink = results.get(0).split(" ");
            if (symlink.length > 2 && symlink[symlink.length - 2].equals("->")) {
                RootTools.log("Symlink found.");
                if (!symlink[symlink.length - 1].equals("") && !symlink[symlink.length - 1].contains("/")) {
                    findBinary(symlink[symlink.length - 1]);
                    if (RootTools.lastFoundBinaryPaths.size() > 0) {
                        final_symlink = RootTools.lastFoundBinaryPaths.get(0) + "/" + symlink[symlink.length - 1];
                    } else {
                        final_symlink = symlink[symlink.length - 1];
                    }
                } else {
                    final_symlink = symlink[symlink.length - 1];
                }
                return final_symlink;
            }
        } catch (Exception e) {
            if (RootTools.debugMode) {
                e.printStackTrace();
            }
        }
        RootTools.log("Symlink not found");
        return "";
    }

    public ArrayList<Symlink> getSymlinks(String path) throws Exception {
        if (!checkUtil("find")) {
            throw new Exception();
        }
        CommandCapture command = new CommandCapture(0, false, "dd if=/dev/zero of=/data/local/symlinks.txt bs=1024 count=1", "chmod 0777 /data/local/symlinks.txt");
        Shell.startRootShell().add(command);
        commandWait(Shell.startRootShell(), command);
        CommandCapture command2 = new CommandCapture(0, false, "find " + path + " -type l -exec ls -l {} \\; > /data/local/symlinks.txt");
        Shell.startRootShell().add(command2);
        commandWait(Shell.startRootShell(), command2);
        InternalVariables.symlinks = getSymLinks();
        if (InternalVariables.symlinks != null) {
            return InternalVariables.symlinks;
        }
        throw new Exception();
    }

    public String getWorkingToolbox() {
        if (RootTools.checkUtil("busybox")) {
            return "busybox";
        }
        if (RootTools.checkUtil("toolbox")) {
            return "toolbox";
        }
        return "";
    }

    public boolean hasEnoughSpaceOnSdCard(long updateSize) {
        RootTools.log("Checking SDcard size and that it is mounted as RW");
        String status = Environment.getExternalStorageState();
        if (!status.equals("mounted")) {
            return false;
        }
        File path = Environment.getExternalStorageDirectory();
        StatFs stat = new StatFs(path.getPath());
        long blockSize = stat.getBlockSize();
        long availableBlocks = stat.getAvailableBlocks();
        return updateSize < availableBlocks * blockSize;
    }

    public boolean hasUtil(final String util, final String box) {
        InternalVariables.found = false;
        if (!box.endsWith("toolbox") && !box.endsWith("busybox")) {
            return false;
        }
        try {
            int i = 0;
            boolean z = false;
            String[] strArr = new String[1];
            strArr[0] = box.endsWith("toolbox") ? box + " " + util : box + " --list";
            CommandCapture command = new CommandCapture(i, z, strArr) { // from class: com.stericson.RootTools.internal.RootToolsInternalMethods.10
                @Override // com.stericson.RootTools.execution.Command
                public void output(int id, String line) {
                    if (box.endsWith("toolbox")) {
                        if (!line.contains("no such tool")) {
                            InternalVariables.found = true;
                        }
                    } else if (box.endsWith("busybox") && line.contains(util)) {
                        RootTools.log("Found util!");
                        InternalVariables.found = true;
                    }
                }
            };
            RootTools.getShell(true).add(command);
            commandWait(RootTools.getShell(true), command);
            if (InternalVariables.found) {
                RootTools.log("Box contains " + util + " util!");
                return true;
            }
            RootTools.log("Box does not contain " + util + " util!");
            return false;
        } catch (Exception e) {
            RootTools.log(e.getMessage());
            return false;
        }
    }

    public boolean installBinary(Context context, int sourceId, String destName, String mode) {
        try {
            Installer installer = new Installer(context);
            return installer.installBinary(sourceId, destName, mode);
        } catch (IOException ex) {
            if (RootTools.debugMode) {
                ex.printStackTrace();
                return false;
            }
            return false;
        }
    }

    public boolean isBinaryAvailable(Context context, String binaryName) {
        try {
            Installer installer = new Installer(context);
            return installer.isBinaryInstalled(binaryName);
        } catch (IOException ex) {
            if (RootTools.debugMode) {
                ex.printStackTrace();
                return false;
            }
            return false;
        }
    }

    public boolean isAppletAvailable(String applet, String binaryPath) {
        try {
            for (String aplet : getBusyBoxApplets(binaryPath)) {
                if (aplet.equals(applet)) {
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            RootTools.log(e.toString());
            return false;
        }
    }

    public boolean isProcessRunning(final String processName) {
        RootTools.log("Checks if process is running: " + processName);
        InternalVariables.processRunning = false;
        try {
            CommandCapture command = new CommandCapture(0, false, new String[]{"ps"}) { // from class: com.stericson.RootTools.internal.RootToolsInternalMethods.11
                @Override // com.stericson.RootTools.execution.Command
                public void output(int id, String line) {
                    if (line.contains(processName)) {
                        InternalVariables.processRunning = true;
                    }
                }
            };
            RootTools.getShell(true).add(command);
            commandWait(RootTools.getShell(true), command);
        } catch (Exception e) {
            RootTools.log(e.getMessage());
        }
        return InternalVariables.processRunning;
    }

    public boolean killProcess(final String processName) {
        RootTools.log("Killing process " + processName);
        InternalVariables.pid_list = "";
        InternalVariables.processRunning = true;
        try {
            CommandCapture command = new CommandCapture(0, false, new String[]{"ps"}) { // from class: com.stericson.RootTools.internal.RootToolsInternalMethods.12
                @Override // com.stericson.RootTools.execution.Command
                public void output(int id, String line) {
                    if (line.contains(processName)) {
                        Matcher psMatcher = InternalVariables.psPattern.matcher(line);
                        try {
                            if (psMatcher.find()) {
                                String pid = psMatcher.group(1);
                                InternalVariables.pid_list += " " + pid;
                                InternalVariables.pid_list = InternalVariables.pid_list.trim();
                                RootTools.log("Found pid: " + pid);
                            } else {
                                RootTools.log("Matching in ps command failed!");
                            }
                        } catch (Exception e) {
                            RootTools.log("Error with regex!");
                            e.printStackTrace();
                        }
                    }
                }
            };
            RootTools.getShell(true).add(command);
            commandWait(RootTools.getShell(true), command);
            String pids = InternalVariables.pid_list;
            if (!pids.equals("")) {
                try {
                    CommandCapture command2 = new CommandCapture(0, false, "kill -9 " + pids);
                    RootTools.getShell(true).add(command2);
                    commandWait(RootTools.getShell(true), command2);
                    return true;
                } catch (Exception e) {
                    RootTools.log(e.getMessage());
                    return false;
                }
            }
            return true;
        } catch (Exception e2) {
            RootTools.log(e2.getMessage());
            return false;
        }
    }

    public void offerBusyBox(Activity activity) {
        RootTools.log("Launching Market for BusyBox");
        Intent i = new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=stericson.busybox"));
        activity.startActivity(i);
    }

    public Intent offerBusyBox(Activity activity, int requestCode) {
        RootTools.log("Launching Market for BusyBox");
        Intent i = new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=stericson.busybox"));
        activity.startActivityForResult(i, requestCode);
        return i;
    }

    public void offerSuperUser(Activity activity) {
        RootTools.log("Launching Market for SuperUser");
        Intent i = new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=com.noshufou.android.su"));
        activity.startActivity(i);
    }

    public Intent offerSuperUser(Activity activity, int requestCode) {
        RootTools.log("Launching Market for SuperUser");
        Intent i = new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=com.noshufou.android.su"));
        activity.startActivityForResult(i, requestCode);
        return i;
    }

    private void commandWait(Shell shell, Command cmd) throws Exception {
        while (!cmd.isFinished()) {
            RootTools.log(Constants.TAG, shell.getCommandQueuePositionString(cmd));
            synchronized (cmd) {
                try {
                    if (!cmd.isFinished()) {
                        cmd.wait(2000L);
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            if (!cmd.isExecuting() && !cmd.isFinished()) {
                if (!shell.isExecuting && !shell.isReading) {
                    Log.e(Constants.TAG, "Waiting for a command to be executed in a shell that is not executing and not reading! \n\n Command: " + cmd.getCommand());
                    Exception e2 = new Exception();
                    e2.setStackTrace(Thread.currentThread().getStackTrace());
                    e2.printStackTrace();
                } else if (shell.isExecuting && !shell.isReading) {
                    Log.e(Constants.TAG, "Waiting for a command to be executed in a shell that is executing but not reading! \n\n Command: " + cmd.getCommand());
                    Exception e3 = new Exception();
                    e3.setStackTrace(Thread.currentThread().getStackTrace());
                    e3.printStackTrace();
                } else {
                    Log.e(Constants.TAG, "Waiting for a command to be executed in a shell that is not reading! \n\n Command: " + cmd.getCommand());
                    Exception e4 = new Exception();
                    e4.setStackTrace(Thread.currentThread().getStackTrace());
                    e4.printStackTrace();
                }
            }
        }
    }
}
