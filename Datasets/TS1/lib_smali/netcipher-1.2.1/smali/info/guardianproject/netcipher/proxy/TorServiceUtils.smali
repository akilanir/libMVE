.class public Linfo/guardianproject/netcipher/proxy/TorServiceUtils;
.super Ljava/lang/Object;
.source "TorServiceUtils.java"


# static fields
.field public static final CHMOD_EXE_VALUE:Ljava/lang/String; = "700"

.field public static final SHELL_CMD_CHMOD:Ljava/lang/String; = "chmod"

.field public static final SHELL_CMD_KILL:Ljava/lang/String; = "kill -9"

.field public static final SHELL_CMD_PIDOF:Ljava/lang/String; = "pidof"

.field public static final SHELL_CMD_PS:Ljava/lang/String; = "ps"

.field public static final SHELL_CMD_RM:Ljava/lang/String; = "rm"

.field private static final TAG:Ljava/lang/String; = "TorUtils"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static doShellCommand([Ljava/lang/String;Ljava/lang/StringBuilder;ZZ)I
    .registers 15
    .param p0, "cmds"    # [Ljava/lang/String;
    .param p1, "log"    # Ljava/lang/StringBuilder;
    .param p2, "runAsRoot"    # Z
    .param p3, "waitFor"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    const/4 v9, -0x1

    .line 182
    const/4 v4, 0x0

    .line 183
    .local v4, "proc":Ljava/lang/Process;
    const/4 v1, -0x1

    .line 185
    .local v1, "exitCode":I
    if-eqz p2, :cond_2a

    .line 186
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v7

    const-string v8, "su"

    invoke-virtual {v7, v8}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v4

    .line 190
    :goto_10
    new-instance v3, Ljava/io/OutputStreamWriter;

    invoke-virtual {v4}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v7

    invoke-direct {v3, v7}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 192
    .local v3, "out":Ljava/io/OutputStreamWriter;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1a
    array-length v7, p0

    if-ge v2, v7, :cond_35

    .line 197
    aget-object v7, p0, v2

    invoke-virtual {v3, v7}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 198
    const-string v7, "\n"

    invoke-virtual {v3, v7}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 192
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 188
    .end local v2    # "i":I
    .end local v3    # "out":Ljava/io/OutputStreamWriter;
    :cond_2a
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v7

    const-string v8, "sh"

    invoke-virtual {v7, v8}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v4

    goto :goto_10

    .line 201
    .restart local v2    # "i":I
    .restart local v3    # "out":Ljava/io/OutputStreamWriter;
    :cond_35
    invoke-virtual {v3}, Ljava/io/OutputStreamWriter;->flush()V

    .line 202
    const-string v7, "exit\n"

    invoke-virtual {v3, v7}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 203
    invoke-virtual {v3}, Ljava/io/OutputStreamWriter;->flush()V

    .line 205
    if-eqz p3, :cond_76

    .line 208
    const/16 v7, 0xa

    new-array v0, v7, [C

    .line 211
    .local v0, "buf":[C
    new-instance v6, Ljava/io/InputStreamReader;

    invoke-virtual {v4}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 212
    .local v6, "reader":Ljava/io/InputStreamReader;
    const/4 v5, 0x0

    .line 213
    .local v5, "read":I
    :cond_50
    :goto_50
    invoke-virtual {v6, v0}, Ljava/io/InputStreamReader;->read([C)I

    move-result v5

    if-eq v5, v9, :cond_5c

    .line 214
    if-eqz p1, :cond_50

    .line 215
    invoke-virtual {p1, v0, v10, v5}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    goto :goto_50

    .line 219
    :cond_5c
    new-instance v6, Ljava/io/InputStreamReader;

    .end local v6    # "reader":Ljava/io/InputStreamReader;
    invoke-virtual {v4}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 220
    .restart local v6    # "reader":Ljava/io/InputStreamReader;
    const/4 v5, 0x0

    .line 221
    :cond_66
    :goto_66
    invoke-virtual {v6, v0}, Ljava/io/InputStreamReader;->read([C)I

    move-result v5

    if-eq v5, v9, :cond_72

    .line 222
    if-eqz p1, :cond_66

    .line 223
    invoke-virtual {p1, v0, v10, v5}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    goto :goto_66

    .line 226
    :cond_72
    invoke-virtual {v4}, Ljava/lang/Process;->waitFor()I

    move-result v1

    .line 230
    .end local v0    # "buf":[C
    .end local v5    # "read":I
    .end local v6    # "reader":Ljava/io/InputStreamReader;
    :cond_76
    return v1
.end method

.method public static findProcessId(Landroid/content/Context;)I
    .registers 9
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 87
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 88
    .local v1, "dataPath":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "org.torproject.android"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/app_bin/tor"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 89
    .local v0, "command":Ljava/lang/String;
    const/4 v4, -0x1

    .line 92
    .local v4, "procId":I
    :try_start_30
    invoke-static {v0}, Linfo/guardianproject/netcipher/proxy/TorServiceUtils;->findProcessIdWithPidOf(Ljava/lang/String;)I

    move-result v4

    .line 94
    const/4 v5, -0x1

    if-ne v4, v5, :cond_3b

    .line 95
    invoke-static {v0}, Linfo/guardianproject/netcipher/proxy/TorServiceUtils;->findProcessIdWithPS(Ljava/lang/String;)I
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_3a} :catch_3c

    move-result v4

    .line 104
    :cond_3b
    :goto_3b
    return v4

    .line 96
    :catch_3c
    move-exception v2

    .line 98
    .local v2, "e":Ljava/lang/Exception;
    :try_start_3d
    invoke-static {v0}, Linfo/guardianproject/netcipher/proxy/TorServiceUtils;->findProcessIdWithPS(Ljava/lang/String;)I
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_3d .. :try_end_40} :catch_42

    move-result v4

    goto :goto_3b

    .line 99
    :catch_42
    move-exception v3

    .line 100
    .local v3, "e2":Ljava/lang/Exception;
    const-string v5, "TorUtils"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to get proc id for command: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3b
.end method

.method public static findProcessIdWithPS(Ljava/lang/String;)I
    .registers 9
    .param p0, "command"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 149
    const/4 v1, -0x1

    .line 151
    .local v1, "procId":I
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v3

    .line 153
    .local v3, "r":Ljava/lang/Runtime;
    const/4 v2, 0x0

    .line 155
    .local v2, "procPs":Ljava/lang/Process;
    const-string v6, "ps"

    invoke-virtual {v3, v6}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v2

    .line 157
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    invoke-virtual {v2}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v4, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 158
    .local v4, "reader":Ljava/io/BufferedReader;
    const/4 v0, 0x0

    .line 160
    .local v0, "line":Ljava/lang/String;
    :cond_1b
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_51

    .line 162
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v7, 0x20

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    const/4 v7, -0x1

    if-eq v6, v7, :cond_1b

    .line 165
    new-instance v5, Ljava/util/StringTokenizer;

    const-string v6, " "

    invoke-direct {v5, v0, v6}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    .local v5, "st":Ljava/util/StringTokenizer;
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 168
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 174
    .end local v5    # "st":Ljava/util/StringTokenizer;
    :cond_51
    return v1
.end method

.method public static findProcessIdWithPidOf(Ljava/lang/String;)I
    .registers 11
    .param p0, "command"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 111
    const/4 v3, -0x1

    .line 113
    .local v3, "procId":I
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v5

    .line 115
    .local v5, "r":Ljava/lang/Runtime;
    const/4 v4, 0x0

    .line 117
    .local v4, "procPs":Ljava/lang/Process;
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 119
    .local v0, "baseName":Ljava/lang/String;
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, "pidof"

    aput-object v9, v7, v8

    const/4 v8, 0x1

    aput-object v0, v7, v8

    invoke-virtual {v5, v7}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v4

    .line 124
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/InputStreamReader;

    invoke-virtual {v4}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v6, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 125
    .local v6, "reader":Ljava/io/BufferedReader;
    const/4 v2, 0x0

    .line 127
    .local v2, "line":Ljava/lang/String;
    :goto_2d
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3b

    .line 133
    :try_start_33
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_3a
    .catch Ljava/lang/NumberFormatException; {:try_start_33 .. :try_end_3a} :catch_3c

    move-result v3

    .line 141
    :cond_3b
    return v3

    .line 135
    :catch_3c
    move-exception v1

    .line 137
    .local v1, "e":Ljava/lang/NumberFormatException;
    const-string v7, "TorServiceUtils"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "unable to parse process pid: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2d
.end method

.method public static isRootPossible()Z
    .registers 9

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 33
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .local v4, "log":Ljava/lang/StringBuilder;
    :try_start_7
    new-instance v3, Ljava/io/File;

    const-string v7, "/system/app/Superuser.apk"

    invoke-direct {v3, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 39
    .local v3, "fileSU":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_15

    .line 83
    .end local v3    # "fileSU":Ljava/io/File;
    :cond_14
    :goto_14
    return v5

    .line 42
    .restart local v3    # "fileSU":Ljava/io/File;
    :cond_15
    new-instance v3, Ljava/io/File;

    .end local v3    # "fileSU":Ljava/io/File;
    const-string v7, "/system/app/superuser.apk"

    invoke-direct {v3, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 43
    .restart local v3    # "fileSU":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_14

    .line 46
    new-instance v3, Ljava/io/File;

    .end local v3    # "fileSU":Ljava/io/File;
    const-string v7, "/system/bin/su"

    invoke-direct {v3, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 47
    .restart local v3    # "fileSU":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_41

    .line 49
    const/4 v7, 0x1

    new-array v0, v7, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "su"

    aput-object v8, v0, v7

    .line 52
    .local v0, "cmd":[Ljava/lang/String;
    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-static {v0, v4, v7, v8}, Linfo/guardianproject/netcipher/proxy/TorServiceUtils;->doShellCommand([Ljava/lang/String;Ljava/lang/StringBuilder;ZZ)I

    move-result v2

    .line 53
    .local v2, "exitCode":I
    if-eqz v2, :cond_14

    move v5, v6

    .line 54
    goto :goto_14

    .line 60
    .end local v0    # "cmd":[Ljava/lang/String;
    .end local v2    # "exitCode":I
    :cond_41
    const/4 v7, 0x1

    new-array v0, v7, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "which su"

    aput-object v8, v0, v7

    .line 63
    .restart local v0    # "cmd":[Ljava/lang/String;
    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-static {v0, v4, v7, v8}, Linfo/guardianproject/netcipher/proxy/TorServiceUtils;->doShellCommand([Ljava/lang/String;Ljava/lang/StringBuilder;ZZ)I

    move-result v2

    .line 65
    .restart local v2    # "exitCode":I
    if-nez v2, :cond_61

    .line 66
    const-string v7, "TorUtils"

    const-string v8, "root exists, but not sure about permissions"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_58
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_58} :catch_59
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_58} :catch_6a

    goto :goto_14

    .line 71
    .end local v0    # "cmd":[Ljava/lang/String;
    .end local v2    # "exitCode":I
    .end local v3    # "fileSU":Ljava/io/File;
    :catch_59
    move-exception v1

    .line 74
    .local v1, "e":Ljava/io/IOException;
    const-string v5, "TorUtils"

    const-string v7, "Error checking for root access"

    invoke-static {v5, v7, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 81
    .end local v1    # "e":Ljava/io/IOException;
    :cond_61
    :goto_61
    const-string v5, "TorUtils"

    const-string v7, "Could not acquire root permissions"

    invoke-static {v5, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v5, v6

    .line 83
    goto :goto_14

    .line 76
    :catch_6a
    move-exception v1

    .line 77
    .local v1, "e":Ljava/lang/Exception;
    const-string v5, "TorUtils"

    const-string v7, "Error checking for root access"

    invoke-static {v5, v7, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_61
.end method
