.class public final Lcom/google/common/reflect/ClassPath;
.super Ljava/lang/Object;
.source "ClassPath.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/reflect/ClassPath$Scanner;,
        Lcom/google/common/reflect/ClassPath$ClassInfo;,
        Lcom/google/common/reflect/ClassPath$ResourceInfo;
    }
.end annotation


# static fields
.field private static final CLASS_FILE_NAME_EXTENSION:Ljava/lang/String; = ".class"

.field private static final CLASS_PATH_ATTRIBUTE_SEPARATOR:Lcom/google/common/base/Splitter;

.field private static final logger:Ljava/util/logging/Logger;


# instance fields
.field private final resources:Lcom/google/common/collect/ImmutableSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableSet",
            "<",
            "Lcom/google/common/reflect/ClassPath$ResourceInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 59
    const-class v0, Lcom/google/common/reflect/ClassPath;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/google/common/reflect/ClassPath;->logger:Ljava/util/logging/Logger;

    .line 62
    const-string v0, " "

    invoke-static {v0}, Lcom/google/common/base/Splitter;->on(Ljava/lang/String;)Lcom/google/common/base/Splitter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/base/Splitter;->omitEmptyStrings()Lcom/google/common/base/Splitter;

    move-result-object v0

    sput-object v0, Lcom/google/common/reflect/ClassPath;->CLASS_PATH_ATTRIBUTE_SEPARATOR:Lcom/google/common/base/Splitter;

    return-void
.end method

.method private constructor <init>(Lcom/google/common/collect/ImmutableSet;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableSet",
            "<",
            "Lcom/google/common/reflect/ClassPath$ResourceInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 69
    .local p1, "resources":Lcom/google/common/collect/ImmutableSet;, "Lcom/google/common/collect/ImmutableSet<Lcom/google/common/reflect/ClassPath$ResourceInfo;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput-object p1, p0, Lcom/google/common/reflect/ClassPath;->resources:Lcom/google/common/collect/ImmutableSet;

    .line 71
    return-void
.end method

.method static synthetic access$000()Ljava/util/logging/Logger;
    .registers 1

    .prologue
    .line 57
    sget-object v0, Lcom/google/common/reflect/ClassPath;->logger:Ljava/util/logging/Logger;

    return-object v0
.end method

.method static synthetic access$100()Lcom/google/common/base/Splitter;
    .registers 1

    .prologue
    .line 57
    sget-object v0, Lcom/google/common/reflect/ClassPath;->CLASS_PATH_ATTRIBUTE_SEPARATOR:Lcom/google/common/base/Splitter;

    return-object v0
.end method

.method public static from(Ljava/lang/ClassLoader;)Lcom/google/common/reflect/ClassPath;
    .registers 6
    .param p0, "classloader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 83
    new-instance v2, Lcom/google/common/reflect/ClassPath$Scanner;

    invoke-direct {v2}, Lcom/google/common/reflect/ClassPath$Scanner;-><init>()V

    .line 84
    .local v2, "scanner":Lcom/google/common/reflect/ClassPath$Scanner;
    invoke-static {p0}, Lcom/google/common/reflect/ClassPath;->getClassPathEntries(Ljava/lang/ClassLoader;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableMap;->entrySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 85
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/net/URI;Ljava/lang/ClassLoader;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/URI;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/ClassLoader;

    invoke-virtual {v2, v3, v4}, Lcom/google/common/reflect/ClassPath$Scanner;->scan(Ljava/net/URI;Ljava/lang/ClassLoader;)V

    goto :goto_11

    .line 87
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/net/URI;Ljava/lang/ClassLoader;>;"
    :cond_2d
    new-instance v3, Lcom/google/common/reflect/ClassPath;

    invoke-virtual {v2}, Lcom/google/common/reflect/ClassPath$Scanner;->getResources()Lcom/google/common/collect/ImmutableSortedSet;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/google/common/reflect/ClassPath;-><init>(Lcom/google/common/collect/ImmutableSet;)V

    return-object v3
.end method

.method static getClassName(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "filename"    # Ljava/lang/String;
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation

    .prologue
    .line 402
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const-string v2, ".class"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    sub-int v0, v1, v2

    .line 403
    .local v0, "classNameEnd":I
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2f

    const/16 v3, 0x2e

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method static getClassPathEntries(Ljava/lang/ClassLoader;)Lcom/google/common/collect/ImmutableMap;
    .registers 11
    .param p0, "classloader"    # Ljava/lang/ClassLoader;
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ClassLoader;",
            ")",
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Ljava/net/URI;",
            "Ljava/lang/ClassLoader;",
            ">;"
        }
    .end annotation

    .prologue
    .line 241
    invoke-static {}, Lcom/google/common/collect/Maps;->newLinkedHashMap()Ljava/util/LinkedHashMap;

    move-result-object v2

    .line 243
    .local v2, "entries":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/net/URI;Ljava/lang/ClassLoader;>;"
    invoke-virtual {p0}, Ljava/lang/ClassLoader;->getParent()Ljava/lang/ClassLoader;

    move-result-object v6

    .line 244
    .local v6, "parent":Ljava/lang/ClassLoader;
    if-eqz v6, :cond_11

    .line 245
    invoke-static {v6}, Lcom/google/common/reflect/ClassPath;->getClassPathEntries(Ljava/lang/ClassLoader;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/util/LinkedHashMap;->putAll(Ljava/util/Map;)V

    .line 247
    :cond_11
    instance-of v9, p0, Ljava/net/URLClassLoader;

    if-eqz v9, :cond_39

    move-object v8, p0

    .line 248
    check-cast v8, Ljava/net/URLClassLoader;

    .line 249
    .local v8, "urlClassLoader":Ljava/net/URLClassLoader;
    invoke-virtual {v8}, Ljava/net/URLClassLoader;->getURLs()[Ljava/net/URL;

    move-result-object v0

    .local v0, "arr$":[Ljava/net/URL;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_1e
    if-ge v4, v5, :cond_39

    aget-object v3, v0, v4

    .line 252
    .local v3, "entry":Ljava/net/URL;
    :try_start_22
    invoke-virtual {v3}, Ljava/net/URL;->toURI()Ljava/net/URI;
    :try_end_25
    .catch Ljava/net/URISyntaxException; {:try_start_22 .. :try_end_25} :catch_32

    move-result-object v7

    .line 256
    .local v7, "uri":Ljava/net/URI;
    invoke-virtual {v2, v7}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2f

    .line 257
    invoke-virtual {v2, v7, p0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    :cond_2f
    add-int/lit8 v4, v4, 0x1

    goto :goto_1e

    .line 253
    .end local v7    # "uri":Ljava/net/URI;
    :catch_32
    move-exception v1

    .line 254
    .local v1, "e":Ljava/net/URISyntaxException;
    new-instance v9, Ljava/lang/IllegalArgumentException;

    invoke-direct {v9, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v9

    .line 261
    .end local v0    # "arr$":[Ljava/net/URL;
    .end local v1    # "e":Ljava/net/URISyntaxException;
    .end local v3    # "entry":Ljava/net/URL;
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    .end local v8    # "urlClassLoader":Ljava/net/URLClassLoader;
    :cond_39
    invoke-static {v2}, Lcom/google/common/collect/ImmutableMap;->copyOf(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v9

    return-object v9
.end method


# virtual methods
.method public getResources()Lcom/google/common/collect/ImmutableSet;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSet",
            "<",
            "Lcom/google/common/reflect/ClassPath$ResourceInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 95
    iget-object v0, p0, Lcom/google/common/reflect/ClassPath;->resources:Lcom/google/common/collect/ImmutableSet;

    return-object v0
.end method

.method public getTopLevelClasses()Lcom/google/common/collect/ImmutableSet;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSet",
            "<",
            "Lcom/google/common/reflect/ClassPath$ClassInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 100
    iget-object v0, p0, Lcom/google/common/reflect/ClassPath;->resources:Lcom/google/common/collect/ImmutableSet;

    invoke-static {v0}, Lcom/google/common/collect/FluentIterable;->from(Ljava/lang/Iterable;)Lcom/google/common/collect/FluentIterable;

    move-result-object v0

    const-class v1, Lcom/google/common/reflect/ClassPath$ClassInfo;

    invoke-virtual {v0, v1}, Lcom/google/common/collect/FluentIterable;->filter(Ljava/lang/Class;)Lcom/google/common/collect/FluentIterable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/FluentIterable;->toSet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method public getTopLevelClasses(Ljava/lang/String;)Lcom/google/common/collect/ImmutableSet;
    .registers 6
    .param p1, "packageName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/common/collect/ImmutableSet",
            "<",
            "Lcom/google/common/reflect/ClassPath$ClassInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 105
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    invoke-static {}, Lcom/google/common/collect/ImmutableSet;->builder()Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v0

    .line 107
    .local v0, "builder":Lcom/google/common/collect/ImmutableSet$Builder;, "Lcom/google/common/collect/ImmutableSet$Builder<Lcom/google/common/reflect/ClassPath$ClassInfo;>;"
    invoke-virtual {p0}, Lcom/google/common/reflect/ClassPath;->getTopLevelClasses()Lcom/google/common/collect/ImmutableSet;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_f
    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_29

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/reflect/ClassPath$ClassInfo;

    .line 108
    .local v1, "classInfo":Lcom/google/common/reflect/ClassPath$ClassInfo;
    invoke-virtual {v1}, Lcom/google/common/reflect/ClassPath$ClassInfo;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 109
    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    goto :goto_f

    .line 112
    .end local v1    # "classInfo":Lcom/google/common/reflect/ClassPath$ClassInfo;
    :cond_29
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSet$Builder;->build()Lcom/google/common/collect/ImmutableSet;

    move-result-object v3

    return-object v3
.end method

.method public getTopLevelClassesRecursive(Ljava/lang/String;)Lcom/google/common/collect/ImmutableSet;
    .registers 8
    .param p1, "packageName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/common/collect/ImmutableSet",
            "<",
            "Lcom/google/common/reflect/ClassPath$ClassInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 120
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x2e

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 122
    .local v3, "packagePrefix":Ljava/lang/String;
    invoke-static {}, Lcom/google/common/collect/ImmutableSet;->builder()Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v0

    .line 123
    .local v0, "builder":Lcom/google/common/collect/ImmutableSet$Builder;, "Lcom/google/common/collect/ImmutableSet$Builder<Lcom/google/common/reflect/ClassPath$ClassInfo;>;"
    invoke-virtual {p0}, Lcom/google/common/reflect/ClassPath;->getTopLevelClasses()Lcom/google/common/collect/ImmutableSet;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/common/collect/ImmutableSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_22
    :goto_22
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/reflect/ClassPath$ClassInfo;

    .line 124
    .local v1, "classInfo":Lcom/google/common/reflect/ClassPath$ClassInfo;
    invoke-virtual {v1}, Lcom/google/common/reflect/ClassPath$ClassInfo;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_22

    .line 125
    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    goto :goto_22

    .line 128
    .end local v1    # "classInfo":Lcom/google/common/reflect/ClassPath$ClassInfo;
    :cond_3c
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSet$Builder;->build()Lcom/google/common/collect/ImmutableSet;

    move-result-object v4

    return-object v4
.end method
