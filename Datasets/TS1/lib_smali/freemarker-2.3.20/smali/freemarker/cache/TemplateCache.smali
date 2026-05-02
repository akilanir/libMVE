.class public Lfreemarker/cache/TemplateCache;
.super Ljava/lang/Object;
.source "TemplateCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/cache/TemplateCache$1;,
        Lfreemarker/cache/TemplateCache$CachedTemplate;,
        Lfreemarker/cache/TemplateCache$TemplateKey;
    }
.end annotation


# static fields
.field private static final ASTERISK:C = '*'

.field private static final ASTERISKSTR:Ljava/lang/String; = "*"

.field private static final CURRENT_DIR_PATH:Ljava/lang/String; = "/./"

.field private static final CURRENT_DIR_PATH_PREFIX:Ljava/lang/String; = "./"

.field private static final INIT_CAUSE:Ljava/lang/reflect/Method;

.field private static final LOCALE_SEPARATOR:Ljava/lang/String; = "_"

.field private static final PARENT_DIR_PATH:Ljava/lang/String; = "/../"

.field private static final PARENT_DIR_PATH_PREFIX:Ljava/lang/String; = "../"

.field private static final SLASH:C = '/'

.field static class$java$lang$Throwable:Ljava/lang/Class;

.field private static final logger:Lfreemarker/log/Logger;


# instance fields
.field private config:Lfreemarker/template/Configuration;

.field private delay:J

.field private final isStorageConcurrent:Z

.field private localizedLookup:Z

.field private final storage:Lfreemarker/cache/CacheStorage;

.field private final templateLoader:Lfreemarker/cache/TemplateLoader;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 95
    const-string v0, "freemarker.cache"

    invoke-static {v0}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v0

    sput-object v0, Lfreemarker/cache/TemplateCache;->logger:Lfreemarker/log/Logger;

    .line 358
    invoke-static {}, Lfreemarker/cache/TemplateCache;->getInitCauseMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/cache/TemplateCache;->INIT_CAUSE:Ljava/lang/reflect/Method;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 119
    invoke-static {}, Lfreemarker/cache/TemplateCache;->createDefaultTemplateLoader()Lfreemarker/cache/TemplateLoader;

    move-result-object v0

    invoke-direct {p0, v0}, Lfreemarker/cache/TemplateCache;-><init>(Lfreemarker/cache/TemplateLoader;)V

    .line 120
    return-void
.end method

.method public constructor <init>(Lfreemarker/cache/TemplateLoader;)V
    .registers 3
    .param p1, "templateLoader"    # Lfreemarker/cache/TemplateLoader;

    .prologue
    .line 138
    new-instance v0, Lfreemarker/cache/SoftCacheStorage;

    invoke-direct {v0}, Lfreemarker/cache/SoftCacheStorage;-><init>()V

    invoke-direct {p0, p1, v0}, Lfreemarker/cache/TemplateCache;-><init>(Lfreemarker/cache/TemplateLoader;Lfreemarker/cache/CacheStorage;)V

    .line 139
    return-void
.end method

.method public constructor <init>(Lfreemarker/cache/TemplateLoader;Lfreemarker/cache/CacheStorage;)V
    .registers 6
    .param p1, "templateLoader"    # Lfreemarker/cache/TemplateLoader;
    .param p2, "cacheStorage"    # Lfreemarker/cache/CacheStorage;

    .prologue
    const/4 v0, 0x1

    .line 147
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    const-wide/16 v1, 0x1388

    iput-wide v1, p0, Lfreemarker/cache/TemplateCache;->delay:J

    .line 105
    iput-boolean v0, p0, Lfreemarker/cache/TemplateCache;->localizedLookup:Z

    .line 148
    iput-object p1, p0, Lfreemarker/cache/TemplateCache;->templateLoader:Lfreemarker/cache/TemplateLoader;

    .line 149
    iput-object p2, p0, Lfreemarker/cache/TemplateCache;->storage:Lfreemarker/cache/CacheStorage;

    .line 150
    if-nez p2, :cond_18

    .line 152
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "storage == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 154
    :cond_18
    instance-of v1, p2, Lfreemarker/cache/ConcurrentCacheStorage;

    if-eqz v1, :cond_27

    check-cast p2, Lfreemarker/cache/ConcurrentCacheStorage;

    .end local p2    # "cacheStorage":Lfreemarker/cache/CacheStorage;
    invoke-interface {p2}, Lfreemarker/cache/ConcurrentCacheStorage;->isConcurrent()Z

    move-result v1

    if-eqz v1, :cond_27

    :goto_24
    iput-boolean v0, p0, Lfreemarker/cache/TemplateCache;->isStorageConcurrent:Z

    .line 156
    return-void

    .line 154
    :cond_27
    const/4 v0, 0x0

    goto :goto_24
.end method

.method private acquireTemplateSource(Ljava/lang/String;)Ljava/lang/Object;
    .registers 18
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 624
    const/16 v13, 0x2a

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 626
    .local v1, "asterisk":I
    const/4 v13, -0x1

    if-ne v1, v13, :cond_16

    .line 628
    move-object/from16 v0, p0

    iget-object v13, v0, Lfreemarker/cache/TemplateCache;->templateLoader:Lfreemarker/cache/TemplateLoader;

    move-object/from16 v0, p1

    invoke-interface {v13, v0}, Lfreemarker/cache/TemplateLoader;->findTemplateSource(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    .line 673
    :cond_15
    :goto_15
    return-object v10

    .line 630
    :cond_16
    new-instance v11, Ljava/util/StringTokenizer;

    const-string v13, "/"

    move-object/from16 v0, p1

    invoke-direct {v11, v0, v13}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 631
    .local v11, "tok":Ljava/util/StringTokenizer;
    const/4 v7, -0x1

    .line 632
    .local v7, "lastAsterisk":I
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 633
    .local v12, "tokpath":Ljava/util/List;
    :goto_25
    invoke-virtual {v11}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v13

    if-eqz v13, :cond_45

    .line 635
    invoke-virtual {v11}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v8

    .line 636
    .local v8, "pathToken":Ljava/lang/String;
    const-string v13, "*"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_41

    .line 638
    const/4 v13, -0x1

    if-eq v7, v13, :cond_3d

    .line 640
    invoke-interface {v12, v7}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 642
    :cond_3d
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v7

    .line 644
    :cond_41
    invoke-interface {v12, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_25

    .line 646
    .end local v8    # "pathToken":Ljava/lang/String;
    :cond_45
    const/4 v13, -0x1

    if-ne v7, v13, :cond_53

    .line 647
    move-object/from16 v0, p0

    iget-object v13, v0, Lfreemarker/cache/TemplateCache;->templateLoader:Lfreemarker/cache/TemplateLoader;

    move-object/from16 v0, p1

    invoke-interface {v13, v0}, Lfreemarker/cache/TemplateLoader;->findTemplateSource(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    goto :goto_15

    .line 649
    :cond_53
    const/4 v13, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13, v7}, Lfreemarker/cache/TemplateCache;->concatPath(Ljava/util/List;II)Ljava/lang/String;

    move-result-object v2

    .line 650
    .local v2, "basePath":Ljava/lang/String;
    add-int/lit8 v13, v7, 0x1

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v14

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13, v14}, Lfreemarker/cache/TemplateCache;->concatPath(Ljava/util/List;II)Ljava/lang/String;

    move-result-object v9

    .line 651
    .local v9, "resourcePath":Ljava/lang/String;
    const-string v13, "/"

    invoke-virtual {v9, v13}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_79

    .line 653
    const/4 v13, 0x0

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v14

    add-int/lit8 v14, v14, -0x1

    invoke-virtual {v9, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 655
    :cond_79
    new-instance v13, Ljava/lang/StringBuffer;

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v14

    invoke-direct {v13, v14}, Ljava/lang/StringBuffer;-><init>(I)V

    invoke-virtual {v13, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    .line 656
    .local v3, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    .line 657
    .local v6, "l":I
    sget-object v13, Lfreemarker/cache/TemplateCache;->logger:Lfreemarker/log/Logger;

    invoke-virtual {v13}, Lfreemarker/log/Logger;->isDebugEnabled()Z

    move-result v4

    .line 660
    .local v4, "debug":Z
    :goto_90
    invoke-virtual {v3, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 661
    .local v5, "fullPath":Ljava/lang/String;
    if-eqz v4, :cond_b6

    .line 663
    sget-object v13, Lfreemarker/cache/TemplateCache;->logger:Lfreemarker/log/Logger;

    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string v15, "Trying to find template source "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-static {v5}, Lfreemarker/template/utility/StringUtil;->jQuoteNoXSS(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;)V

    .line 666
    :cond_b6
    move-object/from16 v0, p0

    iget-object v13, v0, Lfreemarker/cache/TemplateCache;->templateLoader:Lfreemarker/cache/TemplateLoader;

    invoke-interface {v13, v5}, Lfreemarker/cache/TemplateLoader;->findTemplateSource(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    .line 667
    .local v10, "templateSource":Ljava/lang/Object;
    if-nez v10, :cond_15

    .line 671
    if-nez v6, :cond_c5

    .line 673
    const/4 v10, 0x0

    goto/16 :goto_15

    .line 675
    :cond_c5
    const/16 v13, 0x2f

    add-int/lit8 v14, v6, -0x2

    invoke-virtual {v2, v13, v14}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v13

    add-int/lit8 v6, v13, 0x1

    .line 676
    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->setLength(I)V

    goto :goto_90
.end method

.method private buildDebugName(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)Ljava/lang/String;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "encoding"    # Ljava/lang/String;
    .param p4, "parse"    # Z

    .prologue
    .line 553
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-static {p1}, Lfreemarker/template/utility/StringUtil;->jQuoteNoXSS(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-static {p2}, Lfreemarker/template/utility/StringUtil;->jQuoteNoXSS(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    if-eqz p4, :cond_32

    const-string v0, ",parsed] "

    :goto_29
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_32
    const-string v0, ",unparsed]"

    goto :goto_29
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 362
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private concatPath(Ljava/util/List;II)Ljava/lang/String;
    .registers 8
    .param p1, "path"    # Ljava/util/List;
    .param p2, "from"    # I
    .param p3, "to"    # I

    .prologue
    .line 682
    new-instance v0, Ljava/lang/StringBuffer;

    sub-int v2, p3, p2

    mul-int/lit8 v2, v2, 0x10

    invoke-direct {v0, v2}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 683
    .local v0, "buf":Ljava/lang/StringBuffer;
    move v1, p2

    .local v1, "i":I
    :goto_a
    if-ge v1, p3, :cond_1c

    .line 685
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const/16 v3, 0x2f

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 683
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 687
    :cond_1c
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static createDefaultTemplateLoader()Lfreemarker/cache/TemplateLoader;
    .registers 3

    .prologue
    .line 124
    :try_start_0
    new-instance v1, Lfreemarker/cache/FileTemplateLoader;

    invoke-direct {v1}, Lfreemarker/cache/FileTemplateLoader;-><init>()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_6

    .line 127
    .local v0, "e":Ljava/lang/Exception;
    :goto_5
    return-object v1

    .line 125
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_6
    move-exception v0

    .line 126
    .restart local v0    # "e":Ljava/lang/Exception;
    sget-object v1, Lfreemarker/cache/TemplateCache;->logger:Lfreemarker/log/Logger;

    const-string v2, "Could not create a file template loader for current directory"

    invoke-virtual {v1, v2, v0}, Lfreemarker/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 127
    const/4 v1, 0x0

    goto :goto_5
.end method

.method private findTemplateSource(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;
    .registers 15
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    const/4 v10, -0x1

    .line 593
    iget-boolean v8, p0, Lfreemarker/cache/TemplateCache;->localizedLookup:Z

    if-eqz v8, :cond_6e

    .line 594
    const/16 v8, 0x2e

    invoke-virtual {p1, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 595
    .local v1, "lastDot":I
    if-ne v1, v10, :cond_55

    move-object v5, p1

    .line 596
    .local v5, "prefix":Ljava/lang/String;
    :goto_f
    if-ne v1, v10, :cond_5a

    const-string v6, ""

    .line 597
    .local v6, "suffix":Ljava/lang/String;
    :goto_13
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "_"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {p2}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 598
    .local v3, "localeName":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v9

    add-int/2addr v8, v9

    invoke-direct {v0, v8}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 599
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 602
    :goto_3b
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 603
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 604
    .local v4, "path":Ljava/lang/String;
    invoke-direct {p0, v4}, Lfreemarker/cache/TemplateCache;->acquireTemplateSource(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 605
    .local v7, "templateSource":Ljava/lang/Object;
    if-eqz v7, :cond_5f

    .line 618
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    .end local v1    # "lastDot":I
    .end local v3    # "localeName":Ljava/lang/String;
    .end local v4    # "path":Ljava/lang/String;
    .end local v5    # "prefix":Ljava/lang/String;
    .end local v6    # "suffix":Ljava/lang/String;
    .end local v7    # "templateSource":Ljava/lang/Object;
    :goto_54
    return-object v7

    .line 595
    .restart local v1    # "lastDot":I
    :cond_55
    invoke-virtual {p1, v11, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    goto :goto_f

    .line 596
    .restart local v5    # "prefix":Ljava/lang/String;
    :cond_5a
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_13

    .line 609
    .restart local v0    # "buf":Ljava/lang/StringBuffer;
    .restart local v3    # "localeName":Ljava/lang/String;
    .restart local v4    # "path":Ljava/lang/String;
    .restart local v6    # "suffix":Ljava/lang/String;
    .restart local v7    # "templateSource":Ljava/lang/Object;
    :cond_5f
    const/16 v8, 0x5f

    invoke-virtual {v3, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 610
    .local v2, "lastUnderscore":I
    if-ne v2, v10, :cond_69

    .line 614
    const/4 v7, 0x0

    goto :goto_54

    .line 612
    :cond_69
    invoke-virtual {v3, v11, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 613
    goto :goto_3b

    .line 618
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    .end local v1    # "lastDot":I
    .end local v2    # "lastUnderscore":I
    .end local v3    # "localeName":Ljava/lang/String;
    .end local v4    # "path":Ljava/lang/String;
    .end local v5    # "prefix":Ljava/lang/String;
    .end local v6    # "suffix":Ljava/lang/String;
    .end local v7    # "templateSource":Ljava/lang/Object;
    :cond_6e
    invoke-direct {p0, p1}, Lfreemarker/cache/TemplateCache;->acquireTemplateSource(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    goto :goto_54
.end method

.method public static getFullTemplatePath(Lfreemarker/core/Environment;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "env"    # Lfreemarker/core/Environment;
    .param p1, "currentTemplateDir"    # Ljava/lang/String;
    .param p2, "targetTemplatePath"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 570
    invoke-virtual {p0}, Lfreemarker/core/Environment;->isClassicCompatible()Z

    move-result v1

    if-nez v1, :cond_f

    .line 571
    const-string v1, "://"

    invoke-virtual {p2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_10

    .line 586
    :cond_f
    :goto_f
    return-object p2

    .line 574
    :cond_10
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_44

    invoke-virtual {p2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2f

    if-ne v1, v2, :cond_44

    .line 575
    const-string v1, "://"

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 576
    .local v0, "protIndex":I
    if-lez v0, :cond_3e

    .line 577
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    add-int/lit8 v2, v0, 0x2

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_f

    .line 579
    :cond_3e
    const/4 v1, 0x1

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    goto :goto_f

    .line 583
    .end local v0    # "protIndex":I
    :cond_44
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_f
.end method

.method private static final getInitCauseMethod()Ljava/lang/reflect/Method;
    .registers 6

    .prologue
    .line 362
    :try_start_0
    sget-object v1, Lfreemarker/cache/TemplateCache;->class$java$lang$Throwable:Ljava/lang/Class;

    if-nez v1, :cond_26

    const-string v1, "java.lang.Throwable"

    invoke-static {v1}, Lfreemarker/cache/TemplateCache;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/cache/TemplateCache;->class$java$lang$Throwable:Ljava/lang/Class;

    move-object v2, v1

    :goto_d
    const-string v3, "initCause"

    const/4 v1, 0x1

    new-array v4, v1, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v1, Lfreemarker/cache/TemplateCache;->class$java$lang$Throwable:Ljava/lang/Class;

    if-nez v1, :cond_2a

    const-string v1, "java.lang.Throwable"

    invoke-static {v1}, Lfreemarker/cache/TemplateCache;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/cache/TemplateCache;->class$java$lang$Throwable:Ljava/lang/Class;

    :goto_1f
    aput-object v1, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 364
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    :goto_25
    return-object v1

    .line 362
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :cond_26
    sget-object v1, Lfreemarker/cache/TemplateCache;->class$java$lang$Throwable:Ljava/lang/Class;

    move-object v2, v1

    goto :goto_d

    :cond_2a
    sget-object v1, Lfreemarker/cache/TemplateCache;->class$java$lang$Throwable:Ljava/lang/Class;
    :try_end_2c
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_2c} :catch_2d

    goto :goto_1f

    .line 363
    :catch_2d
    move-exception v0

    .line 364
    .restart local v0    # "e":Ljava/lang/NoSuchMethodException;
    const/4 v1, 0x0

    goto :goto_25
.end method

.method private getTemplate(Lfreemarker/cache/TemplateLoader;Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)Lfreemarker/template/Template;
    .registers 33
    .param p1, "loader"    # Lfreemarker/cache/TemplateLoader;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;
    .param p4, "encoding"    # Ljava/lang/String;
    .param p5, "parse"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 213
    sget-object v5, Lfreemarker/cache/TemplateCache;->logger:Lfreemarker/log/Logger;

    invoke-virtual {v5}, Lfreemarker/log/Logger;->isDebugEnabled()Z

    move-result v14

    .line 214
    .local v14, "debug":Z
    if-eqz v14, :cond_81

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move/from16 v4, p5

    invoke-direct {v0, v1, v2, v3, v4}, Lfreemarker/cache/TemplateCache;->buildDebugName(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v15

    .line 217
    .local v15, "debugName":Ljava/lang/String;
    :goto_16
    new-instance v26, Lfreemarker/cache/TemplateCache$TemplateKey;

    move-object/from16 v0, v26

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move/from16 v4, p5

    invoke-direct {v0, v1, v2, v3, v4}, Lfreemarker/cache/TemplateCache$TemplateKey;-><init>(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 220
    .local v26, "tk":Lfreemarker/cache/TemplateCache$TemplateKey;
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lfreemarker/cache/TemplateCache;->isStorageConcurrent:Z

    if-eqz v5, :cond_83

    .line 221
    move-object/from16 v0, p0

    iget-object v5, v0, Lfreemarker/cache/TemplateCache;->storage:Lfreemarker/cache/CacheStorage;

    move-object/from16 v0, v26

    invoke-interface {v5, v0}, Lfreemarker/cache/CacheStorage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lfreemarker/cache/TemplateCache$CachedTemplate;

    .line 228
    .local v12, "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    :goto_37
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v21

    .line 229
    .local v21, "now":J
    const-wide/16 v17, -0x1

    .line 230
    .local v17, "lastModified":J
    const/16 v20, 0x0

    .line 231
    .local v20, "newlyFoundSource":Ljava/lang/Object;
    const/16 v23, 0x0

    .line 233
    .local v23, "rethrown":Z
    if-eqz v12, :cond_276

    .line 235
    :try_start_43
    iget-wide v5, v12, Lfreemarker/cache/TemplateCache$CachedTemplate;->lastChecked:J

    sub-long v5, v21, v5

    move-object/from16 v0, p0

    iget-wide v7, v0, Lfreemarker/cache/TemplateCache;->delay:J

    cmp-long v5, v5, v7

    if-gez v5, :cond_102

    .line 236
    if-eqz v14, :cond_69

    .line 237
    sget-object v5, Lfreemarker/cache/TemplateCache;->logger:Lfreemarker/log/Logger;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " cached copy not yet stale; using cached."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;)V

    .line 240
    :cond_69
    iget-object v0, v12, Lfreemarker/cache/TemplateCache$CachedTemplate;->templateOrException:Ljava/lang/Object;

    move-object/from16 v25, v0

    .line 241
    .local v25, "t":Ljava/lang/Object;
    move-object/from16 v0, v25

    instance-of v5, v0, Lfreemarker/template/Template;

    if-nez v5, :cond_75

    if-nez v25, :cond_99

    .line 242
    :cond_75
    check-cast v25, Lfreemarker/template/Template;
    :try_end_77
    .catch Ljava/lang/RuntimeException; {:try_start_43 .. :try_end_77} :catch_ca
    .catch Ljava/io/IOException; {:try_start_43 .. :try_end_77} :catch_f5
    .catchall {:try_start_43 .. :try_end_77} :catchall_d7

    .line 352
    .end local v25    # "t":Ljava/lang/Object;
    if-eqz v20, :cond_80

    .line 353
    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lfreemarker/cache/TemplateLoader;->closeTemplateSource(Ljava/lang/Object;)V

    .end local v20    # "newlyFoundSource":Ljava/lang/Object;
    :cond_80
    :goto_80
    return-object v25

    .line 214
    .end local v12    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    .end local v15    # "debugName":Ljava/lang/String;
    .end local v17    # "lastModified":J
    .end local v21    # "now":J
    .end local v23    # "rethrown":Z
    .end local v26    # "tk":Lfreemarker/cache/TemplateCache$TemplateKey;
    :cond_81
    const/4 v15, 0x0

    goto :goto_16

    .line 224
    .restart local v15    # "debugName":Ljava/lang/String;
    .restart local v26    # "tk":Lfreemarker/cache/TemplateCache$TemplateKey;
    :cond_83
    move-object/from16 v0, p0

    iget-object v6, v0, Lfreemarker/cache/TemplateCache;->storage:Lfreemarker/cache/CacheStorage;

    monitor-enter v6

    .line 225
    :try_start_88
    move-object/from16 v0, p0

    iget-object v5, v0, Lfreemarker/cache/TemplateCache;->storage:Lfreemarker/cache/CacheStorage;

    move-object/from16 v0, v26

    invoke-interface {v5, v0}, Lfreemarker/cache/CacheStorage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lfreemarker/cache/TemplateCache$CachedTemplate;

    .line 226
    .restart local v12    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    monitor-exit v6

    goto :goto_37

    .end local v12    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    :catchall_96
    move-exception v5

    monitor-exit v6
    :try_end_98
    .catchall {:try_start_88 .. :try_end_98} :catchall_96

    throw v5

    .line 244
    .restart local v12    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    .restart local v17    # "lastModified":J
    .restart local v20    # "newlyFoundSource":Ljava/lang/Object;
    .restart local v21    # "now":J
    .restart local v23    # "rethrown":Z
    .restart local v25    # "t":Ljava/lang/Object;
    :cond_99
    :try_start_99
    move-object/from16 v0, v25

    instance-of v5, v0, Ljava/lang/RuntimeException;

    if-eqz v5, :cond_e2

    .line 245
    move-object/from16 v0, v25

    check-cast v0, Ljava/lang/RuntimeException;

    move-object v5, v0

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lfreemarker/cache/TemplateCache;->throwLoadFailedException(Ljava/lang/Exception;)V

    .line 251
    :cond_a9
    :goto_a9
    new-instance v5, Ljava/lang/RuntimeException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "t is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_ca
    .catch Ljava/lang/RuntimeException; {:try_start_99 .. :try_end_ca} :catch_ca
    .catch Ljava/io/IOException; {:try_start_99 .. :try_end_ca} :catch_f5
    .catchall {:try_start_99 .. :try_end_ca} :catchall_d7

    .line 339
    .end local v20    # "newlyFoundSource":Ljava/lang/Object;
    .end local v25    # "t":Ljava/lang/Object;
    :catch_ca
    move-exception v16

    .line 340
    .local v16, "e":Ljava/lang/RuntimeException;
    :goto_cb
    if-eqz v12, :cond_d6

    .line 341
    :try_start_cd
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v12, v2}, Lfreemarker/cache/TemplateCache;->storeNegativeLookup(Lfreemarker/cache/TemplateCache$TemplateKey;Lfreemarker/cache/TemplateCache$CachedTemplate;Ljava/lang/Exception;)V

    .line 343
    :cond_d6
    throw v16
    :try_end_d7
    .catchall {:try_start_cd .. :try_end_d7} :catchall_d7

    .line 352
    .end local v16    # "e":Ljava/lang/RuntimeException;
    :catchall_d7
    move-exception v5

    :goto_d8
    if-eqz v20, :cond_e1

    .line 353
    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lfreemarker/cache/TemplateLoader;->closeTemplateSource(Ljava/lang/Object;)V

    :cond_e1
    throw v5

    .line 247
    .restart local v20    # "newlyFoundSource":Ljava/lang/Object;
    .restart local v25    # "t":Ljava/lang/Object;
    :cond_e2
    :try_start_e2
    move-object/from16 v0, v25

    instance-of v5, v0, Ljava/io/IOException;

    if-eqz v5, :cond_a9

    .line 248
    const/16 v23, 0x1

    .line 249
    move-object/from16 v0, v25

    check-cast v0, Ljava/io/IOException;

    move-object v5, v0

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lfreemarker/cache/TemplateCache;->throwLoadFailedException(Ljava/lang/Exception;)V
    :try_end_f4
    .catch Ljava/lang/RuntimeException; {:try_start_e2 .. :try_end_f4} :catch_ca
    .catch Ljava/io/IOException; {:try_start_e2 .. :try_end_f4} :catch_f5
    .catchall {:try_start_e2 .. :try_end_f4} :catchall_d7

    goto :goto_a9

    .line 345
    .end local v20    # "newlyFoundSource":Ljava/lang/Object;
    .end local v25    # "t":Ljava/lang/Object;
    :catch_f5
    move-exception v16

    .line 346
    .local v16, "e":Ljava/io/IOException;
    :goto_f6
    if-nez v23, :cond_101

    .line 347
    :try_start_f8
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v12, v2}, Lfreemarker/cache/TemplateCache;->storeNegativeLookup(Lfreemarker/cache/TemplateCache$TemplateKey;Lfreemarker/cache/TemplateCache$CachedTemplate;Ljava/lang/Exception;)V

    .line 349
    :cond_101
    throw v16
    :try_end_102
    .catchall {:try_start_f8 .. :try_end_102} :catchall_d7

    .line 255
    .end local v16    # "e":Ljava/io/IOException;
    .restart local v20    # "newlyFoundSource":Ljava/lang/Object;
    :cond_102
    :try_start_102
    invoke-virtual {v12}, Lfreemarker/cache/TemplateCache$CachedTemplate;->cloneCachedTemplate()Lfreemarker/cache/TemplateCache$CachedTemplate;

    move-result-object v12

    .line 257
    move-wide/from16 v0, v21

    iput-wide v0, v12, Lfreemarker/cache/TemplateCache$CachedTemplate;->lastChecked:J

    .line 260
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lfreemarker/cache/TemplateCache;->findTemplateSource(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v20

    .line 263
    if-nez v20, :cond_145

    .line 264
    if-eqz v14, :cond_130

    .line 265
    sget-object v5, Lfreemarker/cache/TemplateCache;->logger:Lfreemarker/log/Logger;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " no source found."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;)V

    .line 267
    :cond_130
    const/4 v5, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-direct {v0, v1, v12, v5}, Lfreemarker/cache/TemplateCache;->storeNegativeLookup(Lfreemarker/cache/TemplateCache$TemplateKey;Lfreemarker/cache/TemplateCache$CachedTemplate;Ljava/lang/Exception;)V
    :try_end_138
    .catch Ljava/lang/RuntimeException; {:try_start_102 .. :try_end_138} :catch_ca
    .catch Ljava/io/IOException; {:try_start_102 .. :try_end_138} :catch_f5
    .catchall {:try_start_102 .. :try_end_138} :catchall_d7

    .line 268
    const/16 v25, 0x0

    .line 352
    if-eqz v20, :cond_80

    .line 353
    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lfreemarker/cache/TemplateLoader;->closeTemplateSource(Ljava/lang/Object;)V

    goto/16 :goto_80

    .line 273
    :cond_145
    :try_start_145
    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lfreemarker/cache/TemplateLoader;->getLastModified(Ljava/lang/Object;)J

    move-result-wide v17

    .line 274
    iget-wide v5, v12, Lfreemarker/cache/TemplateCache$CachedTemplate;->lastModified:J

    cmp-long v5, v17, v5

    if-nez v5, :cond_19f

    const/16 v19, 0x1

    .line 275
    .local v19, "lastModifiedNotChanged":Z
    :goto_155
    iget-object v5, v12, Lfreemarker/cache/TemplateCache$CachedTemplate;->source:Ljava/lang/Object;

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v24

    .line 276
    .local v24, "sourceEquals":Z
    if-eqz v19, :cond_1a2

    if-eqz v24, :cond_1a2

    .line 277
    if-eqz v14, :cond_187

    .line 278
    sget-object v5, Lfreemarker/cache/TemplateCache;->logger:Lfreemarker/log/Logger;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " using cached since "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    move-object/from16 v0, v20

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " didn\'t change."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;)V

    .line 281
    :cond_187
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-direct {v0, v1, v12}, Lfreemarker/cache/TemplateCache;->storeCached(Lfreemarker/cache/TemplateCache$TemplateKey;Lfreemarker/cache/TemplateCache$CachedTemplate;)V

    .line 282
    iget-object v5, v12, Lfreemarker/cache/TemplateCache$CachedTemplate;->templateOrException:Ljava/lang/Object;

    check-cast v5, Lfreemarker/template/Template;
    :try_end_192
    .catch Ljava/lang/RuntimeException; {:try_start_145 .. :try_end_192} :catch_ca
    .catch Ljava/io/IOException; {:try_start_145 .. :try_end_192} :catch_f5
    .catchall {:try_start_145 .. :try_end_192} :catchall_d7

    .line 352
    if-eqz v20, :cond_19b

    .line 353
    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lfreemarker/cache/TemplateLoader;->closeTemplateSource(Ljava/lang/Object;)V

    :cond_19b
    move-object/from16 v25, v5

    goto/16 :goto_80

    .line 274
    .end local v19    # "lastModifiedNotChanged":Z
    .end local v24    # "sourceEquals":Z
    :cond_19f
    const/16 v19, 0x0

    goto :goto_155

    .line 285
    .restart local v19    # "lastModifiedNotChanged":Z
    .restart local v24    # "sourceEquals":Z
    :cond_1a2
    if-eqz v14, :cond_1de

    if-nez v24, :cond_1de

    .line 286
    :try_start_1a6
    sget-object v5, Lfreemarker/cache/TemplateCache;->logger:Lfreemarker/log/Logger;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Updating source, info for cause: sourceEquals="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    move/from16 v0, v24

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, ", newlyFoundSource="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-static/range {v20 .. v20}, Lfreemarker/template/utility/StringUtil;->jQuoteNoXSS(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, ", cachedTemplate.source="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, v12, Lfreemarker/cache/TemplateCache$CachedTemplate;->source:Ljava/lang/Object;

    invoke-static {v7}, Lfreemarker/template/utility/StringUtil;->jQuoteNoXSS(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;)V

    .line 291
    :cond_1de
    if-eqz v14, :cond_214

    if-nez v19, :cond_214

    .line 292
    sget-object v5, Lfreemarker/cache/TemplateCache;->logger:Lfreemarker/log/Logger;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Updating source, info for cause: lastModifiedNotChanged="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    move/from16 v0, v19

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, ", cache lastModified="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-wide v7, v12, Lfreemarker/cache/TemplateCache$CachedTemplate;->lastModified:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " != file lastModified="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    move-wide/from16 v0, v17

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;)V

    .line 298
    :cond_214
    move-object/from16 v0, v20

    iput-object v0, v12, Lfreemarker/cache/TemplateCache$CachedTemplate;->source:Ljava/lang/Object;

    .line 324
    .end local v19    # "lastModifiedNotChanged":Z
    .end local v24    # "sourceEquals":Z
    :goto_218
    if-eqz v14, :cond_240

    .line 325
    sget-object v5, Lfreemarker/cache/TemplateCache;->logger:Lfreemarker/log/Logger;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Compiling FreeMarker template "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " from "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-static/range {v20 .. v20}, Lfreemarker/template/utility/StringUtil;->jQuoteNoXSS(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;)V

    .line 329
    :cond_240
    iget-object v11, v12, Lfreemarker/cache/TemplateCache$CachedTemplate;->source:Ljava/lang/Object;

    .local v11, "source":Ljava/lang/Object;
    move-object/from16 v5, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    move-object/from16 v9, p4

    move/from16 v10, p5

    .line 330
    invoke-direct/range {v5 .. v11}, Lfreemarker/cache/TemplateCache;->loadTemplate(Lfreemarker/cache/TemplateLoader;Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;ZLjava/lang/Object;)Lfreemarker/template/Template;

    move-result-object v25

    .line 331
    .local v25, "t":Lfreemarker/template/Template;
    move-object/from16 v0, v25

    iput-object v0, v12, Lfreemarker/cache/TemplateCache$CachedTemplate;->templateOrException:Ljava/lang/Object;

    .line 332
    const-wide/high16 v5, -0x8000000000000000L

    cmp-long v5, v17, v5

    if-nez v5, :cond_306

    move-object/from16 v0, p1

    invoke-interface {v0, v11}, Lfreemarker/cache/TemplateLoader;->getLastModified(Ljava/lang/Object;)J

    move-result-wide v5

    :goto_262
    iput-wide v5, v12, Lfreemarker/cache/TemplateCache$CachedTemplate;->lastModified:J

    .line 336
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-direct {v0, v1, v12}, Lfreemarker/cache/TemplateCache;->storeCached(Lfreemarker/cache/TemplateCache$TemplateKey;Lfreemarker/cache/TemplateCache$CachedTemplate;)V
    :try_end_26b
    .catch Ljava/lang/RuntimeException; {:try_start_1a6 .. :try_end_26b} :catch_ca
    .catch Ljava/io/IOException; {:try_start_1a6 .. :try_end_26b} :catch_f5
    .catchall {:try_start_1a6 .. :try_end_26b} :catchall_d7

    .line 352
    if-eqz v20, :cond_80

    .line 353
    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lfreemarker/cache/TemplateLoader;->closeTemplateSource(Ljava/lang/Object;)V

    goto/16 :goto_80

    .line 302
    .end local v11    # "source":Ljava/lang/Object;
    .end local v25    # "t":Lfreemarker/template/Template;
    :cond_276
    if-eqz v14, :cond_2ca

    .line 303
    :try_start_278
    sget-object v6, Lfreemarker/cache/TemplateCache;->logger:Lfreemarker/log/Logger;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Could not find template in cache, creating new one; id=["

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-static/range {v26 .. v26}, Lfreemarker/cache/TemplateCache$TemplateKey;->access$000(Lfreemarker/cache/TemplateCache$TemplateKey;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lfreemarker/template/utility/StringUtil;->jQuoteNoXSS(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v7, "["

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-static/range {v26 .. v26}, Lfreemarker/cache/TemplateCache$TemplateKey;->access$100(Lfreemarker/cache/TemplateCache$TemplateKey;)Ljava/util/Locale;

    move-result-object v7

    invoke-static {v7}, Lfreemarker/template/utility/StringUtil;->jQuoteNoXSS(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v7, ","

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-static/range {v26 .. v26}, Lfreemarker/cache/TemplateCache$TemplateKey;->access$200(Lfreemarker/cache/TemplateCache$TemplateKey;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-static/range {v26 .. v26}, Lfreemarker/cache/TemplateCache$TemplateKey;->access$300(Lfreemarker/cache/TemplateCache$TemplateKey;)Z

    move-result v5

    if-eqz v5, :cond_2f6

    const-string v5, ",parsed] "

    :goto_2b9
    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v7, "]"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;)V

    .line 314
    :cond_2ca
    new-instance v13, Lfreemarker/cache/TemplateCache$CachedTemplate;

    const/4 v5, 0x0

    invoke-direct {v13, v5}, Lfreemarker/cache/TemplateCache$CachedTemplate;-><init>(Lfreemarker/cache/TemplateCache$1;)V
    :try_end_2d0
    .catch Ljava/lang/RuntimeException; {:try_start_278 .. :try_end_2d0} :catch_ca
    .catch Ljava/io/IOException; {:try_start_278 .. :try_end_2d0} :catch_f5
    .catchall {:try_start_278 .. :try_end_2d0} :catchall_d7

    .line 315
    .end local v12    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    .local v13, "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    :try_start_2d0
    move-wide/from16 v0, v21

    iput-wide v0, v13, Lfreemarker/cache/TemplateCache$CachedTemplate;->lastChecked:J

    .line 316
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lfreemarker/cache/TemplateCache;->findTemplateSource(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v20

    .line 317
    if-nez v20, :cond_2f9

    .line 318
    const/4 v5, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-direct {v0, v1, v13, v5}, Lfreemarker/cache/TemplateCache;->storeNegativeLookup(Lfreemarker/cache/TemplateCache$TemplateKey;Lfreemarker/cache/TemplateCache$CachedTemplate;Ljava/lang/Exception;)V
    :try_end_2e8
    .catch Ljava/lang/RuntimeException; {:try_start_2d0 .. :try_end_2e8} :catch_312
    .catch Ljava/io/IOException; {:try_start_2d0 .. :try_end_2e8} :catch_30e
    .catchall {:try_start_2d0 .. :try_end_2e8} :catchall_30a

    .line 319
    const/16 v25, 0x0

    .line 352
    if-eqz v20, :cond_2f3

    .line 353
    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lfreemarker/cache/TemplateLoader;->closeTemplateSource(Ljava/lang/Object;)V

    :cond_2f3
    move-object v12, v13

    .end local v13    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    .restart local v12    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    goto/16 :goto_80

    .line 303
    :cond_2f6
    :try_start_2f6
    const-string v5, ",unparsed] "
    :try_end_2f8
    .catch Ljava/lang/RuntimeException; {:try_start_2f6 .. :try_end_2f8} :catch_ca
    .catch Ljava/io/IOException; {:try_start_2f6 .. :try_end_2f8} :catch_f5
    .catchall {:try_start_2f6 .. :try_end_2f8} :catchall_d7

    goto :goto_2b9

    .line 321
    .end local v12    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    .restart local v13    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    :cond_2f9
    :try_start_2f9
    move-object/from16 v0, v20

    iput-object v0, v13, Lfreemarker/cache/TemplateCache$CachedTemplate;->source:Ljava/lang/Object;

    .line 322
    const-wide/high16 v17, -0x8000000000000000L

    move-wide/from16 v0, v17

    iput-wide v0, v13, Lfreemarker/cache/TemplateCache$CachedTemplate;->lastModified:J
    :try_end_303
    .catch Ljava/lang/RuntimeException; {:try_start_2f9 .. :try_end_303} :catch_312
    .catch Ljava/io/IOException; {:try_start_2f9 .. :try_end_303} :catch_30e
    .catchall {:try_start_2f9 .. :try_end_303} :catchall_30a

    move-object v12, v13

    .end local v13    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    .restart local v12    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    goto/16 :goto_218

    .restart local v11    # "source":Ljava/lang/Object;
    .restart local v25    # "t":Lfreemarker/template/Template;
    :cond_306
    move-wide/from16 v5, v17

    .line 332
    goto/16 :goto_262

    .line 352
    .end local v11    # "source":Ljava/lang/Object;
    .end local v12    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    .end local v20    # "newlyFoundSource":Ljava/lang/Object;
    .end local v25    # "t":Lfreemarker/template/Template;
    .restart local v13    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    :catchall_30a
    move-exception v5

    move-object v12, v13

    .end local v13    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    .restart local v12    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    goto/16 :goto_d8

    .line 345
    .end local v12    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    .restart local v13    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    :catch_30e
    move-exception v16

    move-object v12, v13

    .end local v13    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    .restart local v12    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    goto/16 :goto_f6

    .line 339
    .end local v12    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    .restart local v13    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    :catch_312
    move-exception v16

    move-object v12, v13

    .end local v13    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    .restart local v12    # "cachedTemplate":Lfreemarker/cache/TemplateCache$CachedTemplate;
    goto/16 :goto_cb
.end method

.method private loadTemplate(Lfreemarker/cache/TemplateLoader;Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;ZLjava/lang/Object;)Lfreemarker/template/Template;
    .registers 15
    .param p1, "loader"    # Lfreemarker/cache/TemplateLoader;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;
    .param p4, "encoding"    # Ljava/lang/String;
    .param p5, "parse"    # Z
    .param p6, "source"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 413
    invoke-interface {p1, p6, p4}, Lfreemarker/cache/TemplateLoader;->getReader(Ljava/lang/Object;Ljava/lang/String;)Ljava/io/Reader;

    move-result-object v2

    .line 416
    .local v2, "reader":Ljava/io/Reader;
    if-eqz p5, :cond_26

    .line 419
    :try_start_6
    new-instance v4, Lfreemarker/template/Template;

    iget-object v6, p0, Lfreemarker/cache/TemplateCache;->config:Lfreemarker/template/Configuration;

    invoke-direct {v4, p2, v2, v6, p4}, Lfreemarker/template/Template;-><init>(Ljava/lang/String;Ljava/io/Reader;Lfreemarker/template/Configuration;Ljava/lang/String;)V
    :try_end_d
    .catch Lfreemarker/template/Template$WrongEncodingException; {:try_start_6 .. :try_end_d} :catch_17
    .catchall {:try_start_6 .. :try_end_d} :catchall_3a

    .line 426
    .local v4, "template":Lfreemarker/template/Template;
    :goto_d
    :try_start_d
    invoke-virtual {v4, p3}, Lfreemarker/template/Template;->setLocale(Ljava/util/Locale;)V

    .line 449
    :goto_10
    invoke-virtual {v4, p4}, Lfreemarker/template/Template;->setEncoding(Ljava/lang/String;)V
    :try_end_13
    .catchall {:try_start_d .. :try_end_13} :catchall_3a

    .line 453
    invoke-virtual {v2}, Ljava/io/Reader;->close()V

    .line 455
    return-object v4

    .line 421
    .end local v4    # "template":Lfreemarker/template/Template;
    :catch_17
    move-exception v5

    .line 422
    .local v5, "wee":Lfreemarker/template/Template$WrongEncodingException;
    :try_start_18
    iget-object p4, v5, Lfreemarker/template/Template$WrongEncodingException;->specifiedEncoding:Ljava/lang/String;

    .line 423
    invoke-interface {p1, p6, p4}, Lfreemarker/cache/TemplateLoader;->getReader(Ljava/lang/Object;Ljava/lang/String;)Ljava/io/Reader;

    move-result-object v2

    .line 424
    new-instance v4, Lfreemarker/template/Template;

    iget-object v6, p0, Lfreemarker/cache/TemplateCache;->config:Lfreemarker/template/Configuration;

    invoke-direct {v4, p2, v2, v6, p4}, Lfreemarker/template/Template;-><init>(Ljava/lang/String;Ljava/io/Reader;Lfreemarker/template/Configuration;Ljava/lang/String;)V

    .restart local v4    # "template":Lfreemarker/template/Template;
    goto :goto_d

    .line 432
    .end local v4    # "template":Lfreemarker/template/Template;
    .end local v5    # "wee":Lfreemarker/template/Template$WrongEncodingException;
    :cond_26
    new-instance v3, Ljava/io/StringWriter;

    invoke-direct {v3}, Ljava/io/StringWriter;-><init>()V

    .line 433
    .local v3, "sw":Ljava/io/StringWriter;
    const/16 v6, 0x1000

    new-array v0, v6, [C

    .line 436
    .local v0, "buf":[C
    :cond_2f
    :goto_2f
    invoke-virtual {v2, v0}, Ljava/io/Reader;->read([C)I

    move-result v1

    .line 437
    .local v1, "charsRead":I
    if-lez v1, :cond_3f

    .line 439
    const/4 v6, 0x0

    invoke-virtual {v3, v0, v6, v1}, Ljava/io/StringWriter;->write([CII)V
    :try_end_39
    .catchall {:try_start_18 .. :try_end_39} :catchall_3a

    goto :goto_2f

    .line 453
    .end local v0    # "buf":[C
    .end local v1    # "charsRead":I
    .end local v3    # "sw":Ljava/io/StringWriter;
    :catchall_3a
    move-exception v6

    invoke-virtual {v2}, Ljava/io/Reader;->close()V

    throw v6

    .line 441
    .restart local v0    # "buf":[C
    .restart local v1    # "charsRead":I
    .restart local v3    # "sw":Ljava/io/StringWriter;
    :cond_3f
    const/4 v6, -0x1

    if-ne v1, v6, :cond_2f

    .line 446
    :try_start_42
    invoke-virtual {v3}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lfreemarker/cache/TemplateCache;->config:Lfreemarker/template/Configuration;

    invoke-static {p2, v6, v7}, Lfreemarker/template/Template;->getPlainTextTemplate(Ljava/lang/String;Ljava/lang/String;Lfreemarker/template/Configuration;)Lfreemarker/template/Template;

    move-result-object v4

    .line 447
    .restart local v4    # "template":Lfreemarker/template/Template;
    invoke-virtual {v4, p3}, Lfreemarker/template/Template;->setLocale(Ljava/util/Locale;)V
    :try_end_4f
    .catchall {:try_start_42 .. :try_end_4f} :catchall_3a

    goto :goto_10
.end method

.method private static normalizeName(Ljava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/16 v9, 0x2f

    const/4 v8, 0x1

    const/4 v3, 0x0

    const/4 v7, -0x1

    const/4 v6, 0x0

    .line 692
    invoke-virtual {p0, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-eq v4, v7, :cond_36

    move-object p0, v3

    .line 727
    .end local p0    # "name":Ljava/lang/String;
    .local v1, "parentDirPathLoc":I
    :cond_d
    :goto_d
    return-object p0

    .line 708
    .restart local p0    # "name":Ljava/lang/String;
    :cond_e
    add-int/lit8 v4, v1, -0x1

    invoke-virtual {p0, v9, v4}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v2

    .line 709
    .local v2, "previousSlashLoc":I
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    add-int/lit8 v5, v2, 0x1

    invoke-virtual {p0, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "/../"

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v5, v1

    invoke-virtual {p0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 695
    .end local v1    # "parentDirPathLoc":I
    .end local v2    # "previousSlashLoc":I
    :cond_36
    const-string v4, "/../"

    invoke-virtual {p0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 696
    .restart local v1    # "parentDirPathLoc":I
    if-nez v1, :cond_40

    move-object p0, v3

    .line 699
    goto :goto_d

    .line 701
    :cond_40
    if-ne v1, v7, :cond_e

    .line 702
    const-string v4, "../"

    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6e

    move-object p0, v3

    .line 704
    goto :goto_d

    .line 720
    .local v0, "currentDirPathLoc":I
    :cond_4c
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0, v6, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "/./"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v4, v0

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 713
    .end local v0    # "currentDirPathLoc":I
    :cond_6e
    const-string v3, "/./"

    invoke-virtual {p0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 714
    .restart local v0    # "currentDirPathLoc":I
    if-ne v0, v7, :cond_4c

    .line 715
    const-string v3, "./"

    invoke-virtual {p0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_88

    .line 716
    const-string v3, "./"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 724
    :cond_88
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v8, :cond_d

    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v9, :cond_d

    .line 725
    invoke-virtual {p0, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_d
.end method

.method private storeCached(Lfreemarker/cache/TemplateCache$TemplateKey;Lfreemarker/cache/TemplateCache$CachedTemplate;)V
    .registers 5
    .param p1, "tk"    # Lfreemarker/cache/TemplateCache$TemplateKey;
    .param p2, "cachedTemplate"    # Lfreemarker/cache/TemplateCache$CachedTemplate;

    .prologue
    .line 398
    iget-boolean v0, p0, Lfreemarker/cache/TemplateCache;->isStorageConcurrent:Z

    if-eqz v0, :cond_a

    .line 399
    iget-object v0, p0, Lfreemarker/cache/TemplateCache;->storage:Lfreemarker/cache/CacheStorage;

    invoke-interface {v0, p1, p2}, Lfreemarker/cache/CacheStorage;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 406
    :goto_9
    return-void

    .line 402
    :cond_a
    iget-object v1, p0, Lfreemarker/cache/TemplateCache;->storage:Lfreemarker/cache/CacheStorage;

    monitor-enter v1

    .line 403
    :try_start_d
    iget-object v0, p0, Lfreemarker/cache/TemplateCache;->storage:Lfreemarker/cache/CacheStorage;

    invoke-interface {v0, p1, p2}, Lfreemarker/cache/CacheStorage;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 404
    monitor-exit v1

    goto :goto_9

    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_d .. :try_end_16} :catchall_14

    throw v0
.end method

.method private storeNegativeLookup(Lfreemarker/cache/TemplateCache$TemplateKey;Lfreemarker/cache/TemplateCache$CachedTemplate;Ljava/lang/Exception;)V
    .registers 6
    .param p1, "tk"    # Lfreemarker/cache/TemplateCache$TemplateKey;
    .param p2, "cachedTemplate"    # Lfreemarker/cache/TemplateCache$CachedTemplate;
    .param p3, "e"    # Ljava/lang/Exception;

    .prologue
    .line 391
    iput-object p3, p2, Lfreemarker/cache/TemplateCache$CachedTemplate;->templateOrException:Ljava/lang/Object;

    .line 392
    const/4 v0, 0x0

    iput-object v0, p2, Lfreemarker/cache/TemplateCache$CachedTemplate;->source:Ljava/lang/Object;

    .line 393
    const-wide/16 v0, 0x0

    iput-wide v0, p2, Lfreemarker/cache/TemplateCache$CachedTemplate;->lastModified:J

    .line 394
    invoke-direct {p0, p1, p2}, Lfreemarker/cache/TemplateCache;->storeCached(Lfreemarker/cache/TemplateCache$TemplateKey;Lfreemarker/cache/TemplateCache$CachedTemplate;)V

    .line 395
    return-void
.end method

.method private throwLoadFailedException(Ljava/lang/Exception;)V
    .registers 7
    .param p1, "e"    # Ljava/lang/Exception;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 370
    sget-object v2, Lfreemarker/cache/TemplateCache;->INIT_CAUSE:Ljava/lang/reflect/Method;

    if-eqz v2, :cond_20

    .line 371
    new-instance v1, Ljava/io/IOException;

    const-string v2, "There was an error loading the template on an earlier attempt; it\'s attached as a cause"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 374
    .local v1, "ioe":Ljava/io/IOException;
    :try_start_b
    sget-object v2, Lfreemarker/cache/TemplateCache;->INIT_CAUSE:Ljava/lang/reflect/Method;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_16
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_16} :catch_17
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_16} :catch_19

    .line 386
    :goto_16
    throw v1

    .line 375
    :catch_17
    move-exception v0

    .line 376
    .local v0, "ex":Ljava/lang/RuntimeException;
    throw v0

    .line 377
    .end local v0    # "ex":Ljava/lang/RuntimeException;
    :catch_19
    move-exception v0

    .line 378
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v2, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v2, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 382
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v1    # "ioe":Ljava/io/IOException;
    :cond_20
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "There was an error loading the template on an earlier attempt: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .restart local v1    # "ioe":Ljava/io/IOException;
    goto :goto_16
.end method


# virtual methods
.method public clear()V
    .registers 3

    .prologue
    .line 503
    iget-object v1, p0, Lfreemarker/cache/TemplateCache;->storage:Lfreemarker/cache/CacheStorage;

    monitor-enter v1

    .line 504
    :try_start_3
    iget-object v0, p0, Lfreemarker/cache/TemplateCache;->storage:Lfreemarker/cache/CacheStorage;

    invoke-interface {v0}, Lfreemarker/cache/CacheStorage;->clear()V

    .line 505
    iget-object v0, p0, Lfreemarker/cache/TemplateCache;->templateLoader:Lfreemarker/cache/TemplateLoader;

    instance-of v0, v0, Lfreemarker/cache/StatefulTemplateLoader;

    if-eqz v0, :cond_15

    .line 506
    iget-object v0, p0, Lfreemarker/cache/TemplateCache;->templateLoader:Lfreemarker/cache/TemplateLoader;

    check-cast v0, Lfreemarker/cache/StatefulTemplateLoader;

    invoke-interface {v0}, Lfreemarker/cache/StatefulTemplateLoader;->resetState()V

    .line 508
    :cond_15
    monitor-exit v1

    .line 509
    return-void

    .line 508
    :catchall_17
    move-exception v0

    monitor-exit v1
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_17

    throw v0
.end method

.method public getCacheStorage()Lfreemarker/cache/CacheStorage;
    .registers 2

    .prologue
    .line 176
    iget-object v0, p0, Lfreemarker/cache/TemplateCache;->storage:Lfreemarker/cache/CacheStorage;

    return-object v0
.end method

.method public declared-synchronized getDelay()J
    .registers 3

    .prologue
    .line 465
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lfreemarker/cache/TemplateCache;->delay:J
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-wide v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getLocalizedLookup()Z
    .registers 2

    .prologue
    .line 483
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lfreemarker/cache/TemplateCache;->localizedLookup:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getTemplate(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)Lfreemarker/template/Template;
    .registers 12
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "encoding"    # Ljava/lang/String;
    .param p4, "parseAsFTL"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    if-nez p1, :cond_a

    .line 191
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \"name\" can\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 193
    :cond_a
    if-nez p2, :cond_14

    .line 194
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \"locale\" can\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 196
    :cond_14
    if-nez p3, :cond_1e

    .line 197
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \"encoding\" can\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 199
    :cond_1e
    invoke-static {p1}, Lfreemarker/cache/TemplateCache;->normalizeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 200
    if-nez p1, :cond_26

    .line 201
    const/4 v6, 0x0

    .line 207
    :cond_25
    :goto_25
    return-object v6

    .line 203
    :cond_26
    const/4 v6, 0x0

    .line 204
    .local v6, "result":Lfreemarker/template/Template;
    iget-object v0, p0, Lfreemarker/cache/TemplateCache;->templateLoader:Lfreemarker/cache/TemplateLoader;

    if-eqz v0, :cond_25

    .line 205
    iget-object v1, p0, Lfreemarker/cache/TemplateCache;->templateLoader:Lfreemarker/cache/TemplateLoader;

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lfreemarker/cache/TemplateCache;->getTemplate(Lfreemarker/cache/TemplateLoader;Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)Lfreemarker/template/Template;

    move-result-object v6

    goto :goto_25
.end method

.method public getTemplateLoader()Lfreemarker/cache/TemplateLoader;
    .registers 2

    .prologue
    .line 171
    iget-object v0, p0, Lfreemarker/cache/TemplateCache;->templateLoader:Lfreemarker/cache/TemplateLoader;

    return-object v0
.end method

.method public removeTemplate(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)V
    .registers 11
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "encoding"    # Ljava/lang/String;
    .param p4, "parse"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 523
    if-nez p1, :cond_a

    .line 524
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Argument \"name\" can\'t be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 526
    :cond_a
    if-nez p2, :cond_14

    .line 527
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Argument \"locale\" can\'t be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 529
    :cond_14
    if-nez p3, :cond_1e

    .line 530
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Argument \"encoding\" can\'t be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 532
    :cond_1e
    invoke-static {p1}, Lfreemarker/cache/TemplateCache;->normalizeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 533
    if-eqz p1, :cond_5a

    iget-object v3, p0, Lfreemarker/cache/TemplateCache;->templateLoader:Lfreemarker/cache/TemplateLoader;

    if-eqz v3, :cond_5a

    .line 534
    sget-object v3, Lfreemarker/cache/TemplateCache;->logger:Lfreemarker/log/Logger;

    invoke-virtual {v3}, Lfreemarker/log/Logger;->isDebugEnabled()Z

    move-result v0

    .line 535
    .local v0, "debug":Z
    if-eqz v0, :cond_5b

    invoke-direct {p0, p1, p2, p3, p4}, Lfreemarker/cache/TemplateCache;->buildDebugName(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 538
    .local v1, "debugName":Ljava/lang/String;
    :goto_34
    new-instance v2, Lfreemarker/cache/TemplateCache$TemplateKey;

    invoke-direct {v2, p1, p2, p3, p4}, Lfreemarker/cache/TemplateCache$TemplateKey;-><init>(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 540
    .local v2, "tk":Lfreemarker/cache/TemplateCache$TemplateKey;
    iget-boolean v3, p0, Lfreemarker/cache/TemplateCache;->isStorageConcurrent:Z

    if-eqz v3, :cond_5d

    .line 541
    iget-object v3, p0, Lfreemarker/cache/TemplateCache;->storage:Lfreemarker/cache/CacheStorage;

    invoke-interface {v3, v2}, Lfreemarker/cache/CacheStorage;->remove(Ljava/lang/Object;)V

    .line 547
    :goto_42
    sget-object v3, Lfreemarker/cache/TemplateCache;->logger:Lfreemarker/log/Logger;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " was removed from the cache, if it was there"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;)V

    .line 549
    .end local v0    # "debug":Z
    .end local v1    # "debugName":Ljava/lang/String;
    .end local v2    # "tk":Lfreemarker/cache/TemplateCache$TemplateKey;
    :cond_5a
    return-void

    .line 535
    .restart local v0    # "debug":Z
    :cond_5b
    const/4 v1, 0x0

    goto :goto_34

    .line 543
    .restart local v1    # "debugName":Ljava/lang/String;
    .restart local v2    # "tk":Lfreemarker/cache/TemplateCache$TemplateKey;
    :cond_5d
    iget-object v4, p0, Lfreemarker/cache/TemplateCache;->storage:Lfreemarker/cache/CacheStorage;

    monitor-enter v4

    .line 544
    :try_start_60
    iget-object v3, p0, Lfreemarker/cache/TemplateCache;->storage:Lfreemarker/cache/CacheStorage;

    invoke-interface {v3, v2}, Lfreemarker/cache/CacheStorage;->remove(Ljava/lang/Object;)V

    .line 545
    monitor-exit v4

    goto :goto_42

    :catchall_67
    move-exception v3

    monitor-exit v4
    :try_end_69
    .catchall {:try_start_60 .. :try_end_69} :catchall_67

    throw v3
.end method

.method public setConfiguration(Lfreemarker/template/Configuration;)V
    .registers 2
    .param p1, "config"    # Lfreemarker/template/Configuration;

    .prologue
    .line 165
    iput-object p1, p0, Lfreemarker/cache/TemplateCache;->config:Lfreemarker/template/Configuration;

    .line 166
    invoke-virtual {p0}, Lfreemarker/cache/TemplateCache;->clear()V

    .line 167
    return-void
.end method

.method public declared-synchronized setDelay(J)V
    .registers 4
    .param p1, "delay"    # J

    .prologue
    .line 475
    monitor-enter p0

    :try_start_1
    iput-wide p1, p0, Lfreemarker/cache/TemplateCache;->delay:J
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 476
    monitor-exit p0

    return-void

    .line 475
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setLocalizedLookup(Z)V
    .registers 3
    .param p1, "localizedLookup"    # Z

    .prologue
    .line 491
    monitor-enter p0

    :try_start_1
    iput-boolean p1, p0, Lfreemarker/cache/TemplateCache;->localizedLookup:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 492
    monitor-exit p0

    return-void

    .line 491
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method
