.class public Lfreemarker/ext/dom/Transform;
.super Ljava/lang/Object;
.source "Transform.java"


# instance fields
.field private cfg:Lfreemarker/template/Configuration;

.field private encoding:Ljava/lang/String;

.field private ftlFile:Ljava/io/File;

.field private inputFile:Ljava/io/File;

.field private locale:Ljava/util/Locale;

.field private outputFile:Ljava/io/File;


# direct methods
.method constructor <init>(Ljava/io/File;Ljava/io/File;Ljava/io/File;Ljava/util/Locale;Ljava/lang/String;)V
    .registers 8
    .param p1, "inputFile"    # Ljava/io/File;
    .param p2, "ftlFile"    # Ljava/io/File;
    .param p3, "outputFile"    # Ljava/io/File;
    .param p4, "locale"    # Ljava/util/Locale;
    .param p5, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    if-nez p5, :cond_b

    .line 105
    const-string v1, "file.encoding"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p5

    .line 107
    :cond_b
    if-nez p4, :cond_11

    .line 108
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p4

    .line 110
    :cond_11
    iput-object p5, p0, Lfreemarker/ext/dom/Transform;->encoding:Ljava/lang/String;

    .line 111
    iput-object p4, p0, Lfreemarker/ext/dom/Transform;->locale:Ljava/util/Locale;

    .line 112
    iput-object p1, p0, Lfreemarker/ext/dom/Transform;->inputFile:Ljava/io/File;

    .line 113
    iput-object p2, p0, Lfreemarker/ext/dom/Transform;->ftlFile:Ljava/io/File;

    .line 114
    iput-object p3, p0, Lfreemarker/ext/dom/Transform;->outputFile:Ljava/io/File;

    .line 115
    invoke-virtual {p2}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 116
    .local v0, "ftlDirectory":Ljava/io/File;
    new-instance v1, Lfreemarker/template/Configuration;

    invoke-direct {v1}, Lfreemarker/template/Configuration;-><init>()V

    iput-object v1, p0, Lfreemarker/ext/dom/Transform;->cfg:Lfreemarker/template/Configuration;

    .line 117
    iget-object v1, p0, Lfreemarker/ext/dom/Transform;->cfg:Lfreemarker/template/Configuration;

    invoke-virtual {v1, v0}, Lfreemarker/template/Configuration;->setDirectoryForTemplateLoading(Ljava/io/File;)V

    .line 118
    return-void
.end method

.method static localeFromString(Ljava/lang/String;)Ljava/util/Locale;
    .registers 6
    .param p0, "ls"    # Ljava/lang/String;

    .prologue
    .line 214
    if-nez p0, :cond_4

    const-string p0, ""

    .line 215
    :cond_4
    const-string v1, ""

    .local v1, "lang":Ljava/lang/String;
    const-string v0, ""

    .local v0, "country":Ljava/lang/String;
    const-string v3, ""

    .line 216
    .local v3, "variant":Ljava/lang/String;
    new-instance v2, Ljava/util/StringTokenizer;

    const-string v4, "_-,"

    invoke-direct {v2, p0, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    .local v2, "st":Ljava/util/StringTokenizer;
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v4

    if-eqz v4, :cond_35

    .line 218
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v1

    .line 219
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v4

    if-eqz v4, :cond_2f

    .line 220
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v0

    .line 221
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v4

    if-eqz v4, :cond_2f

    .line 222
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    .line 225
    :cond_2f
    new-instance v4, Ljava/util/Locale;

    invoke-direct {v4, v1, v0, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    :goto_34
    return-object v4

    :cond_35
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    goto :goto_34
.end method

.method public static main([Ljava/lang/String;)V
    .registers 6
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 85
    :try_start_0
    invoke-static {p0}, Lfreemarker/ext/dom/Transform;->transformFromArgs([Ljava/lang/String;)Lfreemarker/ext/dom/Transform;

    move-result-object v2

    .line 86
    .local v2, "proc":Lfreemarker/ext/dom/Transform;
    invoke-virtual {v2}, Lfreemarker/ext/dom/Transform;->transform()V
    :try_end_7
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_7} :catch_8
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_7} :catch_16

    .line 93
    .end local v2    # "proc":Lfreemarker/ext/dom/Transform;
    :goto_7
    return-void

    .line 87
    :catch_8
    move-exception v1

    .line 88
    .local v1, "iae":Ljava/lang/IllegalArgumentException;
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 89
    invoke-static {}, Lfreemarker/ext/dom/Transform;->usage()V

    goto :goto_7

    .line 90
    .end local v1    # "iae":Ljava/lang/IllegalArgumentException;
    :catch_16
    move-exception v0

    .line 91
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_7
.end method

.method static transformFromArgs([Ljava/lang/String;)Lfreemarker/ext/dom/Transform;
    .registers 19
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 141
    const/4 v10, 0x0

    .line 142
    .local v10, "i":I
    const/4 v12, 0x0

    .local v12, "input":Ljava/lang/String;
    const/4 v14, 0x0

    .local v14, "output":Ljava/lang/String;
    const/4 v9, 0x0

    .local v9, "ftl":Ljava/lang/String;
    const/4 v13, 0x0

    .local v13, "loc":Ljava/lang/String;
    const/4 v6, 0x0

    .line 143
    .local v6, "enc":Ljava/lang/String;
    :goto_6
    move-object/from16 v0, p0

    array-length v1, v0

    if-ge v10, v1, :cond_ae

    .line 144
    add-int/lit8 v11, v10, 0x1

    .end local v10    # "i":I
    .local v11, "i":I
    aget-object v8, p0, v10

    .line 145
    .local v8, "dashArg":Ljava/lang/String;
    move-object/from16 v0, p0

    array-length v1, v0

    if-lt v11, v1, :cond_1e

    .line 146
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v16, ""

    move-object/from16 v0, v16

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 148
    :cond_1e
    add-int/lit8 v10, v11, 0x1

    .end local v11    # "i":I
    .restart local v10    # "i":I
    aget-object v7, p0, v11

    .line 149
    .local v7, "arg":Ljava/lang/String;
    const-string v1, "-in"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_38

    .line 150
    if-eqz v12, :cond_36

    .line 151
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v16, "The input file should only be specified once"

    move-object/from16 v0, v16

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 153
    :cond_36
    move-object v12, v7

    goto :goto_6

    .line 154
    :cond_38
    const-string v1, "-ftl"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4e

    .line 155
    if-eqz v9, :cond_4c

    .line 156
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v16, "The ftl file should only be specified once"

    move-object/from16 v0, v16

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 158
    :cond_4c
    move-object v9, v7

    goto :goto_6

    .line 159
    :cond_4e
    const-string v1, "-out"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_64

    .line 160
    if-eqz v14, :cond_62

    .line 161
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v16, "The output file should only be specified once"

    move-object/from16 v0, v16

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 163
    :cond_62
    move-object v14, v7

    goto :goto_6

    .line 164
    :cond_64
    const-string v1, "-locale"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7a

    .line 165
    if-eqz v13, :cond_78

    .line 166
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v16, "The locale should only be specified once"

    move-object/from16 v0, v16

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 168
    :cond_78
    move-object v13, v7

    goto :goto_6

    .line 169
    :cond_7a
    const-string v1, "-encoding"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_91

    .line 170
    if-eqz v6, :cond_8e

    .line 171
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v16, "The encoding should only be specified once"

    move-object/from16 v0, v16

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 173
    :cond_8e
    move-object v6, v7

    goto/16 :goto_6

    .line 175
    :cond_91
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v16, Ljava/lang/StringBuffer;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuffer;-><init>()V

    const-string v17, "Unknown input argument: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 178
    .end local v7    # "arg":Ljava/lang/String;
    .end local v8    # "dashArg":Ljava/lang/String;
    :cond_ae
    if-nez v12, :cond_ba

    .line 179
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v16, "No input file specified."

    move-object/from16 v0, v16

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 181
    :cond_ba
    if-nez v9, :cond_c6

    .line 182
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v16, "No ftl file specified."

    move-object/from16 v0, v16

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 184
    :cond_c6
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v2

    .line 185
    .local v2, "inputFile":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v3

    .line 186
    .local v3, "ftlFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_fb

    .line 187
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v16, Ljava/lang/StringBuffer;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuffer;-><init>()V

    const-string v17, "Input file does not exist: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 189
    :cond_fb
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_11e

    .line 190
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v16, Ljava/lang/StringBuffer;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuffer;-><init>()V

    const-string v17, "FTL file does not exist: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 192
    :cond_11e
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_12a

    invoke-virtual {v2}, Ljava/io/File;->canRead()Z

    move-result v1

    if-nez v1, :cond_147

    .line 193
    :cond_12a
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v16, Ljava/lang/StringBuffer;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuffer;-><init>()V

    const-string v17, "Input file must be a readable file: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 195
    :cond_147
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_153

    invoke-virtual {v3}, Ljava/io/File;->canRead()Z

    move-result v1

    if-nez v1, :cond_170

    .line 196
    :cond_153
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v16, Ljava/lang/StringBuffer;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuffer;-><init>()V

    const-string v17, "FTL file must be a readable file: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 198
    :cond_170
    const/4 v4, 0x0

    .line 199
    .local v4, "outputFile":Ljava/io/File;
    if-eqz v14, :cond_1a9

    .line 200
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v4

    .line 201
    invoke-virtual {v4}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v15

    .line 202
    .local v15, "outputDirectory":Ljava/io/File;
    invoke-virtual {v15}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_18c

    invoke-virtual {v15}, Ljava/io/File;->canWrite()Z

    move-result v1

    if-nez v1, :cond_1a9

    .line 203
    :cond_18c
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v16, Ljava/lang/StringBuffer;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuffer;-><init>()V

    const-string v17, "The output directory must exist and be writable: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 206
    .end local v15    # "outputDirectory":Ljava/io/File;
    :cond_1a9
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    .line 207
    .local v5, "locale":Ljava/util/Locale;
    if-eqz v13, :cond_1b3

    .line 208
    invoke-static {v13}, Lfreemarker/ext/dom/Transform;->localeFromString(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v5

    .line 210
    :cond_1b3
    new-instance v1, Lfreemarker/ext/dom/Transform;

    invoke-direct/range {v1 .. v6}, Lfreemarker/ext/dom/Transform;-><init>(Ljava/io/File;Ljava/io/File;Ljava/io/File;Ljava/util/Locale;Ljava/lang/String;)V

    return-object v1
.end method

.method static usage()V
    .registers 2

    .prologue
    .line 232
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "Usage: java freemarker.ext.dom.Transform -in <xmlfile> -ftl <ftlfile> [-out <outfile>] [-locale <locale>] [-encoding <encoding>]"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 234
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v0

    if-nez v0, :cond_11

    .line 235
    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    .line 237
    :cond_11
    return-void
.end method


# virtual methods
.method transform()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 124
    iget-object v5, p0, Lfreemarker/ext/dom/Transform;->ftlFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    .line 125
    .local v4, "templateName":Ljava/lang/String;
    iget-object v5, p0, Lfreemarker/ext/dom/Transform;->cfg:Lfreemarker/template/Configuration;

    iget-object v6, p0, Lfreemarker/ext/dom/Transform;->locale:Ljava/util/Locale;

    invoke-virtual {v5, v4, v6}, Lfreemarker/template/Configuration;->getTemplate(Ljava/lang/String;Ljava/util/Locale;)Lfreemarker/template/Template;

    move-result-object v3

    .line 126
    .local v3, "template":Lfreemarker/template/Template;
    iget-object v5, p0, Lfreemarker/ext/dom/Transform;->inputFile:Ljava/io/File;

    invoke-static {v5}, Lfreemarker/ext/dom/NodeModel;->parse(Ljava/io/File;)Lfreemarker/ext/dom/NodeModel;

    move-result-object v2

    .line 127
    .local v2, "rootNode":Lfreemarker/ext/dom/NodeModel;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 128
    .local v0, "outputStream":Ljava/io/OutputStream;
    iget-object v5, p0, Lfreemarker/ext/dom/Transform;->outputFile:Ljava/io/File;

    if-eqz v5, :cond_21

    .line 129
    new-instance v0, Ljava/io/FileOutputStream;

    .end local v0    # "outputStream":Ljava/io/OutputStream;
    iget-object v5, p0, Lfreemarker/ext/dom/Transform;->outputFile:Ljava/io/File;

    invoke-direct {v0, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 131
    .restart local v0    # "outputStream":Ljava/io/OutputStream;
    :cond_21
    new-instance v1, Ljava/io/OutputStreamWriter;

    iget-object v5, p0, Lfreemarker/ext/dom/Transform;->encoding:Ljava/lang/String;

    invoke-direct {v1, v0, v5}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 133
    .local v1, "outputWriter":Ljava/io/Writer;
    const/4 v5, 0x0

    const/4 v6, 0x0

    :try_start_2a
    invoke-virtual {v3, v5, v1, v6, v2}, Lfreemarker/template/Template;->process(Ljava/lang/Object;Ljava/io/Writer;Lfreemarker/template/ObjectWrapper;Lfreemarker/template/TemplateNodeModel;)V
    :try_end_2d
    .catchall {:try_start_2a .. :try_end_2d} :catchall_35

    .line 135
    iget-object v5, p0, Lfreemarker/ext/dom/Transform;->outputFile:Ljava/io/File;

    if-eqz v5, :cond_34

    .line 136
    invoke-virtual {v1}, Ljava/io/Writer;->close()V

    .line 138
    :cond_34
    return-void

    .line 135
    :catchall_35
    move-exception v5

    iget-object v6, p0, Lfreemarker/ext/dom/Transform;->outputFile:Ljava/io/File;

    if-eqz v6, :cond_3d

    .line 136
    invoke-virtual {v1}, Ljava/io/Writer;->close()V

    :cond_3d
    throw v5
.end method
