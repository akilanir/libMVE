.class public Lorg/msgpack/util/TemplatePrecompiler;
.super Ljava/lang/Object;
.source "TemplatePrecompiler.java"


# static fields
.field public static final DEFAULT_DEST:Ljava/lang/String; = "."

.field public static final DEST:Ljava/lang/String; = "msgpack.template.destdir"

.field private static final LOG:Ljava/util/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 48
    const-class v0, Lorg/msgpack/util/TemplatePrecompiler;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lorg/msgpack/util/TemplatePrecompiler;->LOG:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static deleteTemplateClass(Ljava/lang/Class;)Z
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 134
    .local p0, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v6, Lorg/msgpack/util/TemplatePrecompiler;->LOG:Ljava/util/logging/Logger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Deleting template of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "..."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 135
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v2

    .line 136
    .local v2, "props":Ljava/util/Properties;
    const-string v6, "msgpack.template.destdir"

    const-string v7, "."

    invoke-static {v2, v6, v7}, Lorg/msgpack/util/TemplatePrecompiler;->getDirName(Ljava/util/Properties;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 137
    .local v1, "distDirName":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    .line 138
    .local v4, "targetClassName":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v7, 0x2e

    sget-char v8, Ljava/io/File;->separatorChar:C

    invoke-virtual {v4, v7, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "_$$_Template.class"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 140
    .local v3, "targetClassFileName":Ljava/lang/String;
    new-instance v5, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-char v7, Ljava/io/File;->separatorChar:C

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 142
    .local v5, "targetFile":Ljava/io/File;
    const/4 v0, 0x0

    .line 143
    .local v0, "deleted":Z
    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-nez v6, :cond_7a

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_7a

    .line 144
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    move-result v0

    .line 146
    :cond_7a
    sget-object v6, Lorg/msgpack/util/TemplatePrecompiler;->LOG:Ljava/util/logging/Logger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Deleted .class file of template class of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 147
    return v0
.end method

.method private static getDirName(Ljava/util/Properties;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "props"    # Ljava/util/Properties;
    .param p1, "dirName"    # Ljava/lang/String;
    .param p2, "defaultDirName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 152
    invoke-virtual {p0, p1, p2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 153
    .local v1, "dName":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 154
    .local v0, "d":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_2e

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_2e

    .line 155
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Directory not exists: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 157
    :cond_2e
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static main([Ljava/lang/String;)V
    .registers 1
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 161
    invoke-static {p0}, Lorg/msgpack/util/TemplatePrecompiler;->saveTemplates([Ljava/lang/String;)V

    .line 162
    return-void
.end method

.method private static matchClassNames(Ljava/util/List;Ljava/lang/String;)V
    .registers 19
    .param p1, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    .local p0, "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v14, 0x0

    const/16 v15, 0x2e

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v15

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 72
    .local v9, "packageName":Ljava/lang/String;
    const/16 v14, 0x2e

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v14

    add-int/lit8 v14, v14, 0x1

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v15

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    .line 74
    .local v13, "relativedName":Ljava/lang/String;
    const-string v14, "*"

    const-string v15, "(\\w+)"

    invoke-virtual {v13, v14, v15}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v11

    .line 75
    .local v11, "patName":Ljava/lang/String;
    invoke-static {v11}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v10

    .line 77
    .local v10, "pat":Ljava/util/regex/Pattern;
    invoke-static {}, Ljavax/tools/ToolProvider;->getSystemJavaCompiler()Ljavax/tools/JavaCompiler;

    move-result-object v1

    .line 78
    .local v1, "compiler":Ljavax/tools/JavaCompiler;
    new-instance v14, Ljavax/tools/DiagnosticCollector;

    invoke-direct {v14}, Ljavax/tools/DiagnosticCollector;-><init>()V

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object/from16 v0, v16

    invoke-interface {v1, v14, v15, v0}, Ljavax/tools/JavaCompiler;->getStandardFileManager(Ljavax/tools/DiagnosticListener;Ljava/util/Locale;Ljava/nio/charset/Charset;)Ljavax/tools/StandardJavaFileManager;

    move-result-object v3

    .line 80
    .local v3, "fm":Ljavax/tools/JavaFileManager;
    new-instance v5, Lorg/msgpack/util/TemplatePrecompiler$1;

    invoke-direct {v5}, Lorg/msgpack/util/TemplatePrecompiler$1;-><init>()V

    .line 86
    .local v5, "kind":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljavax/tools/JavaFileObject$Kind;>;"
    sget-object v14, Ljavax/tools/StandardLocation;->PLATFORM_CLASS_PATH:Ljavax/tools/StandardLocation;

    const/4 v15, 0x0

    invoke-interface {v3, v14, v9, v5, v15}, Ljavax/tools/JavaFileManager;->list(Ljavax/tools/JavaFileManager$Location;Ljava/lang/String;Ljava/util/Set;Z)Ljava/lang/Iterable;

    move-result-object v14

    invoke-interface {v14}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_51
    :goto_51
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_a1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/tools/JavaFileObject;

    .line 87
    .local v2, "f":Ljavax/tools/JavaFileObject;
    invoke-interface {v2}, Ljavax/tools/JavaFileObject;->getName()Ljava/lang/String;

    move-result-object v12

    .line 88
    .local v12, "relatived0":Ljava/lang/String;
    const/4 v14, 0x0

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v15

    const-string v16, ".class"

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v16

    sub-int v15, v15, v16

    invoke-virtual {v12, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 89
    .local v8, "name0":Ljava/lang/String;
    invoke-virtual {v10, v8}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    .line 90
    .local v6, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v6}, Ljava/util/regex/Matcher;->matches()Z

    move-result v14

    if-eqz v14, :cond_51

    .line 91
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/16 v15, 0x2e

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 92
    .local v7, "name":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-interface {v0, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_51

    .line 93
    move-object/from16 v0, p0

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_51

    .line 97
    .end local v2    # "f":Ljavax/tools/JavaFileObject;
    .end local v6    # "m":Ljava/util/regex/Matcher;
    .end local v7    # "name":Ljava/lang/String;
    .end local v8    # "name0":Ljava/lang/String;
    .end local v12    # "relatived0":Ljava/lang/String;
    :cond_a1
    return-void
.end method

.method public static saveTemplateClass(Lorg/msgpack/template/TemplateRegistry;Ljava/lang/Class;)V
    .registers 7
    .param p0, "registry"    # Lorg/msgpack/template/TemplateRegistry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/msgpack/template/TemplateRegistry;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v2, Lorg/msgpack/util/TemplatePrecompiler;->LOG:Ljava/util/logging/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Saving template of "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "..."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 120
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v1

    .line 121
    .local v1, "props":Ljava/util/Properties;
    const-string v2, "msgpack.template.destdir"

    const-string v3, "."

    invoke-static {v1, v2, v3}, Lorg/msgpack/util/TemplatePrecompiler;->getDirName(Ljava/util/Properties;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 122
    .local v0, "distDirName":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/Class;->isEnum()Z

    move-result v2

    if-eqz v2, :cond_51

    .line 123
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Not supported enum type yet: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 126
    :cond_51
    new-instance v2, Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    invoke-direct {v2, p0}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;-><init>(Lorg/msgpack/template/TemplateRegistry;)V

    invoke-virtual {v2, p1, v0}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->writeTemplate(Ljava/lang/reflect/Type;Ljava/lang/String;)V

    .line 129
    sget-object v2, Lorg/msgpack/util/TemplatePrecompiler;->LOG:Ljava/util/logging/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Saved .class file of template class of "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 130
    return-void
.end method

.method public static saveTemplateClasses(Lorg/msgpack/template/TemplateRegistry;[Ljava/lang/Class;)V
    .registers 6
    .param p0, "registry"    # Lorg/msgpack/template/TemplateRegistry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/msgpack/template/TemplateRegistry;",
            "[",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    .local p1, "targetClasses":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_3
    if-ge v2, v3, :cond_d

    aget-object v1, v0, v2

    .line 113
    .local v1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, v1}, Lorg/msgpack/util/TemplatePrecompiler;->saveTemplateClass(Lorg/msgpack/template/TemplateRegistry;Ljava/lang/Class;)V

    .line 112
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 115
    .end local v1    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_d
    return-void
.end method

.method public static saveTemplates([Ljava/lang/String;)V
    .registers 10
    .param p0, "classNames"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 57
    new-instance v5, Lorg/msgpack/template/TemplateRegistry;

    const/4 v8, 0x0

    invoke-direct {v5, v8}, Lorg/msgpack/template/TemplateRegistry;-><init>(Lorg/msgpack/template/TemplateRegistry;)V

    .line 58
    .local v5, "registry":Lorg/msgpack/template/TemplateRegistry;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .local v6, "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_e
    if-ge v3, v4, :cond_18

    aget-object v2, v0, v3

    .line 60
    .local v2, "className":Ljava/lang/String;
    invoke-static {v6, v2}, Lorg/msgpack/util/TemplatePrecompiler;->matchClassNames(Ljava/util/List;Ljava/lang/String;)V

    .line 59
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 62
    .end local v2    # "className":Ljava/lang/String;
    :cond_18
    invoke-static {v6}, Lorg/msgpack/util/TemplatePrecompiler;->toClass(Ljava/util/List;)Ljava/util/List;

    move-result-object v7

    .line 63
    .local v7, "ret0":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<*>;>;"
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_20
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_30

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 64
    .local v1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v5, v1}, Lorg/msgpack/util/TemplatePrecompiler;->saveTemplateClass(Lorg/msgpack/template/TemplateRegistry;Ljava/lang/Class;)V

    goto :goto_20

    .line 66
    .end local v1    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_30
    return-void
.end method

.method private static toClass(Ljava/util/List;)Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 101
    .local p0, "classNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 102
    .local v4, "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<*>;>;"
    const-class v5, Lorg/msgpack/util/TemplatePrecompiler;

    invoke-virtual {v5}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 103
    .local v1, "cl":Ljava/lang/ClassLoader;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_13
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_27

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 104
    .local v2, "className":Ljava/lang/String;
    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 105
    .local v0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_13

    .line 107
    .end local v0    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "className":Ljava/lang/String;
    :cond_27
    return-object v4
.end method
