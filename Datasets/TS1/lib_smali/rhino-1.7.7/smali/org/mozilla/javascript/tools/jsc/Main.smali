.class public Lorg/mozilla/javascript/tools/jsc/Main;
.super Ljava/lang/Object;
.source "Main.java"


# instance fields
.field private characterEncoding:Ljava/lang/String;

.field private compiler:Lorg/mozilla/javascript/optimizer/ClassCompiler;

.field private compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

.field private destinationDir:Ljava/lang/String;

.field private printHelp:Z

.field private reporter:Lorg/mozilla/javascript/tools/ToolErrorReporter;

.field private targetName:Ljava/lang/String;

.field private targetPackage:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Lorg/mozilla/javascript/tools/ToolErrorReporter;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/tools/ToolErrorReporter;-><init>(Z)V

    iput-object v0, p0, Lorg/mozilla/javascript/tools/jsc/Main;->reporter:Lorg/mozilla/javascript/tools/ToolErrorReporter;

    .line 46
    new-instance v0, Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-direct {v0}, Lorg/mozilla/javascript/CompilerEnvirons;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/tools/jsc/Main;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    .line 47
    iget-object v0, p0, Lorg/mozilla/javascript/tools/jsc/Main;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    iget-object v1, p0, Lorg/mozilla/javascript/tools/jsc/Main;->reporter:Lorg/mozilla/javascript/tools/ToolErrorReporter;

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/CompilerEnvirons;->setErrorReporter(Lorg/mozilla/javascript/ErrorReporter;)V

    .line 48
    new-instance v0, Lorg/mozilla/javascript/optimizer/ClassCompiler;

    iget-object v1, p0, Lorg/mozilla/javascript/tools/jsc/Main;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/optimizer/ClassCompiler;-><init>(Lorg/mozilla/javascript/CompilerEnvirons;)V

    iput-object v0, p0, Lorg/mozilla/javascript/tools/jsc/Main;->compiler:Lorg/mozilla/javascript/optimizer/ClassCompiler;

    .line 49
    return-void
.end method

.method private addError(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "arg"    # Ljava/lang/String;

    .prologue
    .line 341
    if-nez p2, :cond_a

    .line 342
    invoke-static {p1}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 346
    .local v0, "msg":Ljava/lang/String;
    :goto_6
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/tools/jsc/Main;->addFormatedError(Ljava/lang/String;)V

    .line 347
    return-void

    .line 344
    .end local v0    # "msg":Ljava/lang/String;
    :cond_a
    invoke-static {p1, p2}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "msg":Ljava/lang/String;
    goto :goto_6
.end method

.method private addFormatedError(Ljava/lang/String;)V
    .registers 8
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v3, -0x1

    .line 351
    iget-object v0, p0, Lorg/mozilla/javascript/tools/jsc/Main;->reporter:Lorg/mozilla/javascript/tools/ToolErrorReporter;

    move-object v1, p1

    move-object v4, v2

    move v5, v3

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->error(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 352
    return-void
.end method

.method private static badUsage(Ljava/lang/String;)V
    .registers 4
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 212
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "msg.jsc.bad.usage"

    const-class v2, Lorg/mozilla/javascript/tools/jsc/Main;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, p0}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 214
    return-void
.end method

.method private getOutputFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    .registers 9
    .param p1, "parentDir"    # Ljava/io/File;
    .param p2, "className"    # Ljava/lang/String;

    .prologue
    .line 296
    const/16 v4, 0x2e

    sget-char v5, Ljava/io/File;->separatorChar:C

    invoke-virtual {p2, v4, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    .line 297
    .local v3, "path":Ljava/lang/String;
    const-string v4, ".class"

    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 298
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 299
    .local v2, "f":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v1

    .line 300
    .local v1, "dirPath":Ljava/lang/String;
    if-eqz v1, :cond_27

    .line 301
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 302
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_27

    .line 303
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 306
    .end local v0    # "dir":Ljava/io/File;
    :cond_27
    return-object v2
.end method

.method public static main([Ljava/lang/String;)V
    .registers 5
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 28
    new-instance v0, Lorg/mozilla/javascript/tools/jsc/Main;

    invoke-direct {v0}, Lorg/mozilla/javascript/tools/jsc/Main;-><init>()V

    .line 29
    .local v0, "main":Lorg/mozilla/javascript/tools/jsc/Main;
    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/tools/jsc/Main;->processOptions([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 30
    if-nez p0, :cond_28

    .line 31
    iget-boolean v1, v0, Lorg/mozilla/javascript/tools/jsc/Main;->printHelp:Z

    if-eqz v1, :cond_24

    .line 32
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "msg.jsc.usage"

    const-class v3, Lorg/mozilla/javascript/tools/jsc/Main;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 34
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    .line 36
    :cond_24
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    .line 38
    :cond_28
    iget-object v1, v0, Lorg/mozilla/javascript/tools/jsc/Main;->reporter:Lorg/mozilla/javascript/tools/ToolErrorReporter;

    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->hasReportedError()Z

    move-result v1

    if-nez v1, :cond_33

    .line 39
    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/tools/jsc/Main;->processSource([Ljava/lang/String;)V

    .line 41
    :cond_33
    return-void
.end method

.method private static p(Ljava/lang/String;)V
    .registers 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 335
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 336
    return-void
.end method

.method private readSource(Ljava/io/File;)Ljava/lang/String;
    .registers 8
    .param p1, "f"    # Ljava/io/File;

    .prologue
    const/4 v4, 0x0

    .line 278
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 279
    .local v0, "absPath":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v3

    if-nez v3, :cond_12

    .line 280
    const-string v3, "msg.jsfile.not.found"

    invoke-direct {p0, v3, v0}, Lorg/mozilla/javascript/tools/jsc/Main;->addError(Ljava/lang/String;Ljava/lang/String;)V

    move-object v3, v4

    .line 291
    :goto_11
    return-object v3

    .line 284
    :cond_12
    const/4 v3, 0x1

    :try_start_13
    iget-object v5, p0, Lorg/mozilla/javascript/tools/jsc/Main;->characterEncoding:Ljava/lang/String;

    invoke-static {v0, v3, v5}, Lorg/mozilla/javascript/tools/SourceReader;->readFileOrUrl(Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;
    :try_end_1b
    .catch Ljava/io/FileNotFoundException; {:try_start_13 .. :try_end_1b} :catch_1c
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_1b} :catch_24

    goto :goto_11

    .line 286
    :catch_1c
    move-exception v1

    .line 287
    .local v1, "ex":Ljava/io/FileNotFoundException;
    const-string v3, "msg.couldnt.open"

    invoke-direct {p0, v3, v0}, Lorg/mozilla/javascript/tools/jsc/Main;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .end local v1    # "ex":Ljava/io/FileNotFoundException;
    :goto_22
    move-object v3, v4

    .line 291
    goto :goto_11

    .line 288
    :catch_24
    move-exception v2

    .line 289
    .local v2, "ioe":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/mozilla/javascript/tools/jsc/Main;->addFormatedError(Ljava/lang/String;)V

    goto :goto_22
.end method


# virtual methods
.method getClassName(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x5f

    .line 316
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    new-array v4, v5, [C

    .line 318
    .local v4, "s":[C
    const/4 v2, 0x0

    .line 320
    .local v2, "j":I
    const/4 v5, 0x0

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isJavaIdentifierStart(C)Z

    move-result v5

    if-nez v5, :cond_1b

    .line 321
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "j":I
    .local v3, "j":I
    aput-char v6, v4, v2

    move v2, v3

    .line 323
    .end local v3    # "j":I
    .restart local v2    # "j":I
    :cond_1b
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1c
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v1, v5, :cond_36

    .line 324
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 325
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v5

    if-eqz v5, :cond_33

    .line 326
    aput-char v0, v4, v2

    .line 323
    :goto_2e
    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v2, v2, 0x1

    goto :goto_1c

    .line 328
    :cond_33
    aput-char v6, v4, v2

    goto :goto_2e

    .line 331
    .end local v0    # "c":C
    :cond_36
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v4}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public processOptions([Ljava/lang/String;)[Ljava/lang/String;
    .registers 26
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    .line 57
    const-string v22, ""

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/tools/jsc/Main;->targetPackage:Ljava/lang/String;

    .line 58
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/jsc/Main;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-virtual/range {v22 .. v23}, Lorg/mozilla/javascript/CompilerEnvirons;->setGenerateDebugInfo(Z)V

    .line 59
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_14
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v8, v0, :cond_318

    .line 60
    aget-object v3, p1, v8

    .line 61
    .local v3, "arg":Ljava/lang/String;
    const-string v22, "-"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_65

    .line 62
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v22, v0

    sub-int v18, v22, v8

    .line 63
    .local v18, "tail":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/jsc/Main;->targetName:Ljava/lang/String;

    move-object/from16 v22, v0

    if-eqz v22, :cond_53

    const/16 v22, 0x1

    move/from16 v0, v18

    move/from16 v1, v22

    if-le v0, v1, :cond_53

    .line 64
    const-string v22, "msg.multiple.js.to.file"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/jsc/Main;->targetName:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/tools/jsc/Main;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    const/4 v15, 0x0

    .line 206
    .end local v3    # "arg":Ljava/lang/String;
    .end local v18    # "tail":I
    :cond_52
    :goto_52
    return-object v15

    .line 67
    .restart local v3    # "arg":Ljava/lang/String;
    .restart local v18    # "tail":I
    :cond_53
    move/from16 v0, v18

    new-array v15, v0, [Ljava/lang/String;

    .line 68
    .local v15, "result":[Ljava/lang/String;
    const/4 v10, 0x0

    .local v10, "j":I
    :goto_58
    move/from16 v0, v18

    if-eq v10, v0, :cond_52

    .line 69
    add-int v22, v8, v10

    aget-object v22, p1, v22

    aput-object v22, v15, v10

    .line 68
    add-int/lit8 v10, v10, 0x1

    goto :goto_58

    .line 73
    .end local v10    # "j":I
    .end local v15    # "result":[Ljava/lang/String;
    .end local v18    # "tail":I
    :cond_65
    const-string v22, "-help"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_83

    const-string v22, "-h"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_83

    const-string v22, "--help"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_8d

    .line 76
    :cond_83
    const/16 v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/mozilla/javascript/tools/jsc/Main;->printHelp:Z

    .line 77
    const/4 v15, 0x0

    goto :goto_52

    .line 81
    :cond_8d
    :try_start_8d
    const-string v22, "-version"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_b9

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v8, v0, :cond_b9

    .line 82
    aget-object v22, p1, v8

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v21

    .line 83
    .local v21, "version":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/jsc/Main;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/CompilerEnvirons;->setLanguageVersion(I)V

    .line 59
    .end local v21    # "version":I
    :goto_b5
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_14

    .line 86
    :cond_b9
    const-string v22, "-opt"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_cd

    const-string v22, "-O"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_f3

    :cond_cd
    add-int/lit8 v8, v8, 0x1

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v8, v0, :cond_f3

    .line 89
    aget-object v22, p1, v8

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13

    .line 90
    .local v13, "optLevel":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/jsc/Main;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v13}, Lorg/mozilla/javascript/CompilerEnvirons;->setOptimizationLevel(I)V
    :try_end_e9
    .catch Ljava/lang/NumberFormatException; {:try_start_8d .. :try_end_e9} :catch_ea

    goto :goto_b5

    .line 94
    .end local v13    # "optLevel":I
    :catch_ea
    move-exception v6

    .line 95
    .local v6, "e":Ljava/lang/NumberFormatException;
    aget-object v22, p1, v8

    invoke-static/range {v22 .. v22}, Lorg/mozilla/javascript/tools/jsc/Main;->badUsage(Ljava/lang/String;)V

    .line 96
    const/4 v15, 0x0

    goto/16 :goto_52

    .line 98
    .end local v6    # "e":Ljava/lang/NumberFormatException;
    :cond_f3
    const-string v22, "-nosource"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_109

    .line 99
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/jsc/Main;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-virtual/range {v22 .. v23}, Lorg/mozilla/javascript/CompilerEnvirons;->setGeneratingSource(Z)V

    goto :goto_b5

    .line 102
    :cond_109
    const-string v22, "-debug"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_11d

    const-string v22, "-g"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_129

    .line 103
    :cond_11d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/jsc/Main;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v22, v0

    const/16 v23, 0x1

    invoke-virtual/range {v22 .. v23}, Lorg/mozilla/javascript/CompilerEnvirons;->setGenerateDebugInfo(Z)V

    goto :goto_b5

    .line 106
    :cond_129
    const-string v22, "-main-method-class"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_14b

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v8, v0, :cond_14b

    .line 107
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/jsc/Main;->compiler:Lorg/mozilla/javascript/optimizer/ClassCompiler;

    move-object/from16 v22, v0

    aget-object v23, p1, v8

    invoke-virtual/range {v22 .. v23}, Lorg/mozilla/javascript/optimizer/ClassCompiler;->setMainMethodClass(Ljava/lang/String;)V

    goto/16 :goto_b5

    .line 110
    :cond_14b
    const-string v22, "-encoding"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_16a

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v8, v0, :cond_16a

    .line 111
    aget-object v22, p1, v8

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/tools/jsc/Main;->characterEncoding:Ljava/lang/String;

    goto/16 :goto_b5

    .line 114
    :cond_16a
    const-string v22, "-o"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_1de

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v8, v0, :cond_1de

    .line 115
    aget-object v12, p1, v8

    .line 116
    .local v12, "name":Ljava/lang/String;
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v7

    .line 117
    .local v7, "end":I
    if-eqz v7, :cond_195

    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-virtual {v12, v0}, Ljava/lang/String;->charAt(I)C

    move-result v22

    invoke-static/range {v22 .. v22}, Ljava/lang/Character;->isJavaIdentifierStart(C)Z

    move-result v22

    if-nez v22, :cond_1a0

    .line 120
    :cond_195
    const-string v22, "msg.invalid.classfile.name"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v1, v12}, Lorg/mozilla/javascript/tools/jsc/Main;->addError(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_b5

    .line 123
    :cond_1a0
    const/4 v10, 0x1

    .restart local v10    # "j":I
    :goto_1a1
    if-ge v10, v7, :cond_1cb

    .line 124
    invoke-virtual {v12, v10}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 125
    .local v4, "c":C
    invoke-static {v4}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v22

    if-nez v22, :cond_1db

    .line 126
    const/16 v22, 0x2e

    move/from16 v0, v22

    if-ne v4, v0, :cond_1d1

    .line 128
    add-int/lit8 v22, v7, -0x6

    move/from16 v0, v22

    if-ne v10, v0, :cond_1d1

    const-string v22, ".class"

    move-object/from16 v0, v22

    invoke-virtual {v12, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_1d1

    .line 129
    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-virtual {v12, v0, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 137
    .end local v4    # "c":C
    :cond_1cb
    :goto_1cb
    move-object/from16 v0, p0

    iput-object v12, v0, Lorg/mozilla/javascript/tools/jsc/Main;->targetName:Ljava/lang/String;

    goto/16 :goto_b5

    .line 133
    .restart local v4    # "c":C
    :cond_1d1
    const-string v22, "msg.invalid.classfile.name"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v1, v12}, Lorg/mozilla/javascript/tools/jsc/Main;->addError(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1cb

    .line 123
    :cond_1db
    add-int/lit8 v10, v10, 0x1

    goto :goto_1a1

    .line 140
    .end local v4    # "c":C
    .end local v7    # "end":I
    .end local v10    # "j":I
    .end local v12    # "name":Ljava/lang/String;
    :cond_1de
    const-string v22, "-observe-instruction-count"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_1f3

    .line 141
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/jsc/Main;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v22, v0

    const/16 v23, 0x1

    invoke-virtual/range {v22 .. v23}, Lorg/mozilla/javascript/CompilerEnvirons;->setGenerateObserverCount(Z)V

    .line 143
    :cond_1f3
    const-string v22, "-package"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_257

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v8, v0, :cond_257

    .line 144
    aget-object v14, p1, v8

    .line 145
    .local v14, "pkg":Ljava/lang/String;
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v7

    .line 146
    .restart local v7    # "end":I
    const/4 v10, 0x0

    .restart local v10    # "j":I
    :goto_20f
    if-eq v10, v7, :cond_22b

    .line 147
    invoke-virtual {v14, v10}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 148
    .restart local v4    # "c":C
    invoke-static {v4}, Ljava/lang/Character;->isJavaIdentifierStart(C)Z

    move-result v22

    if-eqz v22, :cond_243

    .line 149
    add-int/lit8 v10, v10, 0x1

    :goto_21d
    if-eq v10, v7, :cond_229

    .line 150
    invoke-virtual {v14, v10}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 151
    invoke-static {v4}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v22

    if-nez v22, :cond_231

    .line 155
    :cond_229
    if-ne v10, v7, :cond_234

    .line 165
    .end local v4    # "c":C
    :cond_22b
    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/mozilla/javascript/tools/jsc/Main;->targetPackage:Ljava/lang/String;

    goto/16 :goto_b5

    .line 149
    .restart local v4    # "c":C
    :cond_231
    add-int/lit8 v10, v10, 0x1

    goto :goto_21d

    .line 158
    :cond_234
    const/16 v22, 0x2e

    move/from16 v0, v22

    if-ne v4, v0, :cond_243

    add-int/lit8 v22, v7, -0x1

    move/from16 v0, v22

    if-eq v10, v0, :cond_243

    .line 146
    add-int/lit8 v10, v10, 0x1

    goto :goto_20f

    .line 162
    :cond_243
    const-string v22, "msg.package.name"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/jsc/Main;->targetPackage:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/tools/jsc/Main;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    const/4 v15, 0x0

    goto/16 :goto_52

    .line 168
    .end local v4    # "c":C
    .end local v7    # "end":I
    .end local v10    # "j":I
    .end local v14    # "pkg":Ljava/lang/String;
    :cond_257
    const-string v22, "-extends"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_28c

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v8, v0, :cond_28c

    .line 169
    aget-object v19, p1, v8

    .line 172
    .local v19, "targetExtends":Ljava/lang/String;
    :try_start_26e
    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_271
    .catch Ljava/lang/ClassNotFoundException; {:try_start_26e .. :try_end_271} :catch_281

    move-result-object v17

    .line 176
    .local v17, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/jsc/Main;->compiler:Lorg/mozilla/javascript/optimizer/ClassCompiler;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/optimizer/ClassCompiler;->setTargetExtends(Ljava/lang/Class;)V

    goto/16 :goto_b5

    .line 173
    .end local v17    # "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_281
    move-exception v6

    .line 174
    .local v6, "e":Ljava/lang/ClassNotFoundException;
    new-instance v22, Ljava/lang/Error;

    invoke-virtual {v6}, Ljava/lang/ClassNotFoundException;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v22

    .line 179
    .end local v6    # "e":Ljava/lang/ClassNotFoundException;
    .end local v19    # "targetExtends":Ljava/lang/String;
    :cond_28c
    const-string v22, "-implements"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_2f3

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v8, v0, :cond_2f3

    .line 181
    aget-object v20, p1, v8

    .line 182
    .local v20, "targetImplements":Ljava/lang/String;
    new-instance v16, Ljava/util/StringTokenizer;

    const-string v22, ","

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    .local v16, "st":Ljava/util/StringTokenizer;
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 185
    .local v11, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<*>;>;"
    :goto_2b5
    invoke-virtual/range {v16 .. v16}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v22

    if-eqz v22, :cond_2d4

    .line 186
    invoke-virtual/range {v16 .. v16}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    .line 188
    .local v5, "className":Ljava/lang/String;
    :try_start_2bf
    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-interface {v11, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2c8
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2bf .. :try_end_2c8} :catch_2c9

    goto :goto_2b5

    .line 189
    :catch_2c9
    move-exception v6

    .line 190
    .restart local v6    # "e":Ljava/lang/ClassNotFoundException;
    new-instance v22, Ljava/lang/Error;

    invoke-virtual {v6}, Ljava/lang/ClassNotFoundException;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v22

    .line 193
    .end local v5    # "className":Ljava/lang/String;
    .end local v6    # "e":Ljava/lang/ClassNotFoundException;
    :cond_2d4
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v22

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-interface {v11, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Ljava/lang/Class;

    .line 194
    .local v9, "implementsClasses":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/jsc/Main;->compiler:Lorg/mozilla/javascript/optimizer/ClassCompiler;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v9}, Lorg/mozilla/javascript/optimizer/ClassCompiler;->setTargetImplements([Ljava/lang/Class;)V

    goto/16 :goto_b5

    .line 197
    .end local v9    # "implementsClasses":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v11    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<*>;>;"
    .end local v16    # "st":Ljava/util/StringTokenizer;
    .end local v20    # "targetImplements":Ljava/lang/String;
    :cond_2f3
    const-string v22, "-d"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_312

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v8, v0, :cond_312

    .line 198
    aget-object v22, p1, v8

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/tools/jsc/Main;->destinationDir:Ljava/lang/String;

    goto/16 :goto_b5

    .line 201
    :cond_312
    invoke-static {v3}, Lorg/mozilla/javascript/tools/jsc/Main;->badUsage(Ljava/lang/String;)V

    .line 202
    const/4 v15, 0x0

    goto/16 :goto_52

    .line 205
    .end local v3    # "arg":Ljava/lang/String;
    :cond_318
    const-string v22, "msg.no.file"

    invoke-static/range {v22 .. v22}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Lorg/mozilla/javascript/tools/jsc/Main;->p(Ljava/lang/String;)V

    .line 206
    const/4 v15, 0x0

    goto/16 :goto_52
.end method

.method public processSource([Ljava/lang/String;)V
    .registers 23
    .param p1, "filenames"    # [Ljava/lang/String;

    .prologue
    .line 222
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    if-eq v8, v0, :cond_1f

    .line 223
    aget-object v7, p1, v8

    .line 224
    .local v7, "filename":Ljava/lang/String;
    const-string v19, ".js"

    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_20

    .line 225
    const-string v19, "msg.extension.not.js"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v7}, Lorg/mozilla/javascript/tools/jsc/Main;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    .end local v7    # "filename":Ljava/lang/String;
    :cond_1f
    return-void

    .line 228
    .restart local v7    # "filename":Ljava/lang/String;
    :cond_20
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 229
    .local v6, "f":Ljava/io/File;
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lorg/mozilla/javascript/tools/jsc/Main;->readSource(Ljava/io/File;)Ljava/lang/String;

    move-result-object v17

    .line 230
    .local v17, "source":Ljava/lang/String;
    if-eqz v17, :cond_1f

    .line 232
    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/mozilla/javascript/tools/jsc/Main;->targetName:Ljava/lang/String;

    .line 233
    .local v11, "mainClassName":Ljava/lang/String;
    if-nez v11, :cond_4d

    .line 234
    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v12

    .line 235
    .local v12, "name":Ljava/lang/String;
    const/16 v19, 0x0

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v20

    add-int/lit8 v20, v20, -0x3

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v12, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    .line 236
    .local v13, "nojs":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lorg/mozilla/javascript/tools/jsc/Main;->getClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 238
    .end local v12    # "name":Ljava/lang/String;
    .end local v13    # "nojs":Ljava/lang/String;
    :cond_4d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/jsc/Main;->targetPackage:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v19

    if-eqz v19, :cond_78

    .line 239
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/jsc/Main;->targetPackage:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "."

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 242
    :cond_78
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/jsc/Main;->compiler:Lorg/mozilla/javascript/optimizer/ClassCompiler;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    move/from16 v2, v20

    invoke-virtual {v0, v1, v7, v2, v11}, Lorg/mozilla/javascript/optimizer/ClassCompiler;->compileToClassFiles(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)[Ljava/lang/Object;

    move-result-object v5

    .line 245
    .local v5, "compiled":[Ljava/lang/Object;
    if-eqz v5, :cond_1f

    array-length v0, v5

    move/from16 v19, v0

    if-eqz v19, :cond_1f

    .line 249
    const/16 v18, 0x0

    .line 250
    .local v18, "targetTopDir":Ljava/io/File;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/jsc/Main;->destinationDir:Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_d2

    .line 251
    new-instance v18, Ljava/io/File;

    .end local v18    # "targetTopDir":Ljava/io/File;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/jsc/Main;->destinationDir:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-direct/range {v18 .. v19}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 258
    .restart local v18    # "targetTopDir":Ljava/io/File;
    :cond_a6
    :goto_a6
    const/4 v10, 0x0

    .local v10, "j":I
    :goto_a7
    array-length v0, v5

    move/from16 v19, v0

    move/from16 v0, v19

    if-eq v10, v0, :cond_f4

    .line 259
    aget-object v4, v5, v10

    check-cast v4, Ljava/lang/String;

    .line 260
    .local v4, "className":Ljava/lang/String;
    add-int/lit8 v19, v10, 0x1

    aget-object v19, v5, v19

    check-cast v19, [B

    move-object/from16 v3, v19

    check-cast v3, [B

    .line 261
    .local v3, "bytes":[B
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v4}, Lorg/mozilla/javascript/tools/jsc/Main;->getOutputFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v15

    .line 263
    .local v15, "outfile":Ljava/io/File;
    :try_start_c4
    new-instance v14, Ljava/io/FileOutputStream;

    invoke-direct {v14, v15}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_c9
    .catch Ljava/io/IOException; {:try_start_c4 .. :try_end_c9} :catch_e7

    .line 265
    .local v14, "os":Ljava/io/FileOutputStream;
    :try_start_c9
    invoke-virtual {v14, v3}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_cc
    .catchall {:try_start_c9 .. :try_end_cc} :catchall_e2

    .line 267
    :try_start_cc
    invoke-virtual {v14}, Ljava/io/FileOutputStream;->close()V
    :try_end_cf
    .catch Ljava/io/IOException; {:try_start_cc .. :try_end_cf} :catch_e7

    .line 258
    .end local v14    # "os":Ljava/io/FileOutputStream;
    :goto_cf
    add-int/lit8 v10, v10, 0x2

    goto :goto_a7

    .line 253
    .end local v3    # "bytes":[B
    .end local v4    # "className":Ljava/lang/String;
    .end local v10    # "j":I
    .end local v15    # "outfile":Ljava/io/File;
    :cond_d2
    invoke-virtual {v6}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v16

    .line 254
    .local v16, "parent":Ljava/lang/String;
    if-eqz v16, :cond_a6

    .line 255
    new-instance v18, Ljava/io/File;

    .end local v18    # "targetTopDir":Ljava/io/File;
    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .restart local v18    # "targetTopDir":Ljava/io/File;
    goto :goto_a6

    .line 267
    .end local v16    # "parent":Ljava/lang/String;
    .restart local v3    # "bytes":[B
    .restart local v4    # "className":Ljava/lang/String;
    .restart local v10    # "j":I
    .restart local v14    # "os":Ljava/io/FileOutputStream;
    .restart local v15    # "outfile":Ljava/io/File;
    :catchall_e2
    move-exception v19

    :try_start_e3
    invoke-virtual {v14}, Ljava/io/FileOutputStream;->close()V

    throw v19
    :try_end_e7
    .catch Ljava/io/IOException; {:try_start_e3 .. :try_end_e7} :catch_e7

    .line 269
    .end local v14    # "os":Ljava/io/FileOutputStream;
    :catch_e7
    move-exception v9

    .line 270
    .local v9, "ioe":Ljava/io/IOException;
    invoke-virtual {v9}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/tools/jsc/Main;->addFormatedError(Ljava/lang/String;)V

    goto :goto_cf

    .line 222
    .end local v3    # "bytes":[B
    .end local v4    # "className":Ljava/lang/String;
    .end local v9    # "ioe":Ljava/io/IOException;
    .end local v15    # "outfile":Ljava/io/File;
    :cond_f4
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_1
.end method
