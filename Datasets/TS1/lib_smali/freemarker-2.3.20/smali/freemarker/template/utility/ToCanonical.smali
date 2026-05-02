.class public Lfreemarker/template/utility/ToCanonical;
.super Ljava/lang/Object;
.source "ToCanonical.java"


# static fields
.field static config:Lfreemarker/template/Configuration;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 68
    invoke-static {}, Lfreemarker/template/Configuration;->getDefaultConfiguration()Lfreemarker/template/Configuration;

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/ToCanonical;->config:Lfreemarker/template/Configuration;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static convertFile(Ljava/io/File;)V
    .registers 9
    .param p0, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    invoke-virtual {p0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v3

    .line 91
    .local v3, "fullPath":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 92
    .local v1, "dir":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    .line 93
    .local v2, "filename":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, ".canonical"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v0, v1, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 94
    .local v0, "convertedFile":Ljava/io/File;
    sget-object v6, Lfreemarker/template/utility/ToCanonical;->config:Lfreemarker/template/Configuration;

    invoke-virtual {v6, v1}, Lfreemarker/template/Configuration;->setDirectoryForTemplateLoading(Ljava/io/File;)V

    .line 95
    sget-object v6, Lfreemarker/template/utility/ToCanonical;->config:Lfreemarker/template/Configuration;

    invoke-virtual {v6, v2}, Lfreemarker/template/Configuration;->getTemplate(Ljava/lang/String;)Lfreemarker/template/Template;

    move-result-object v5

    .line 96
    .local v5, "template":Lfreemarker/template/Template;
    new-instance v4, Ljava/io/FileWriter;

    invoke-direct {v4, v0}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    .line 98
    .local v4, "output":Ljava/io/FileWriter;
    :try_start_34
    invoke-virtual {v5, v4}, Lfreemarker/template/Template;->dump(Ljava/io/Writer;)V
    :try_end_37
    .catchall {:try_start_34 .. :try_end_37} :catchall_3b

    .line 100
    invoke-virtual {v4}, Ljava/io/FileWriter;->close()V

    .line 102
    return-void

    .line 100
    :catchall_3b
    move-exception v6

    invoke-virtual {v4}, Ljava/io/FileWriter;->close()V

    throw v6
.end method

.method public static main([Ljava/lang/String;)V
    .registers 7
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 71
    sget-object v3, Lfreemarker/template/utility/ToCanonical;->config:Lfreemarker/template/Configuration;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lfreemarker/template/Configuration;->setWhitespaceStripping(Z)V

    .line 72
    array-length v3, p0

    if-nez v3, :cond_c

    .line 73
    invoke-static {}, Lfreemarker/template/utility/ToCanonical;->usage()V

    .line 75
    :cond_c
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_d
    array-length v3, p0

    if-ge v2, v3, :cond_5e

    .line 76
    new-instance v1, Ljava/io/File;

    aget-object v3, p0, v2

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 77
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_3b

    .line 78
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "File "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " doesn\'t exist."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 81
    :cond_3b
    :try_start_3b
    invoke-static {v1}, Lfreemarker/template/utility/ToCanonical;->convertFile(Ljava/io/File;)V
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_3e} :catch_41

    .line 75
    :goto_3e
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 82
    :catch_41
    move-exception v0

    .line 83
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Error converting file: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 84
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3e

    .line 87
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "f":Ljava/io/File;
    :cond_5e
    return-void
.end method

.method static usage()V
    .registers 2

    .prologue
    .line 105
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "Usage: java freemarker.template.utility.ToCanonical <filename(s)>"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 106
    return-void
.end method
