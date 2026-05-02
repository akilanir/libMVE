.class Lorg/junit/runner/JUnitCommandLineParseResult;
.super Ljava/lang/Object;
.source "JUnitCommandLineParseResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/junit/runner/JUnitCommandLineParseResult$CommandLineParserError;
    }
.end annotation


# instance fields
.field private final classes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation
.end field

.field private final filterSpecs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final parserErrors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/junit/runner/JUnitCommandLineParseResult;->filterSpecs:Ljava/util/List;

    .line 14
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/junit/runner/JUnitCommandLineParseResult;->classes:Ljava/util/List;

    .line 15
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/junit/runner/JUnitCommandLineParseResult;->parserErrors:Ljava/util/List;

    .line 20
    return-void
.end method

.method private applyFilterSpecs(Lorg/junit/runner/Request;)Lorg/junit/runner/Request;
    .registers 7
    .param p1, "request"    # Lorg/junit/runner/Request;

    .prologue
    .line 128
    :try_start_0
    iget-object v4, p0, Lorg/junit/runner/JUnitCommandLineParseResult;->filterSpecs:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 129
    .local v2, "filterSpec":Ljava/lang/String;
    invoke-static {p1, v2}, Lorg/junit/runner/FilterFactories;->createFilterFromFilterSpec(Lorg/junit/runner/Request;Ljava/lang/String;)Lorg/junit/runner/manipulation/Filter;

    move-result-object v1

    .line 131
    .local v1, "filter":Lorg/junit/runner/manipulation/Filter;
    invoke-virtual {p1, v1}, Lorg/junit/runner/Request;->filterWith(Lorg/junit/runner/manipulation/Filter;)Lorg/junit/runner/Request;
    :try_end_19
    .catch Lorg/junit/runner/FilterFactory$FilterNotCreatedException; {:try_start_0 .. :try_end_19} :catch_1d

    move-result-object p1

    .line 132
    goto :goto_6

    .end local v1    # "filter":Lorg/junit/runner/manipulation/Filter;
    .end local v2    # "filterSpec":Ljava/lang/String;
    :cond_1b
    move-object v4, p1

    .line 135
    .end local v3    # "i$":Ljava/util/Iterator;
    :goto_1c
    return-object v4

    .line 134
    :catch_1d
    move-exception v0

    .line 135
    .local v0, "e":Lorg/junit/runner/FilterFactory$FilterNotCreatedException;
    invoke-direct {p0, v0}, Lorg/junit/runner/JUnitCommandLineParseResult;->errorReport(Ljava/lang/Throwable;)Lorg/junit/runner/Request;

    move-result-object v4

    goto :goto_1c
.end method

.method private copyArray([Ljava/lang/String;II)[Ljava/lang/String;
    .registers 7
    .param p1, "args"    # [Ljava/lang/String;
    .param p2, "from"    # I
    .param p3, "to"    # I

    .prologue
    .line 88
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 90
    .local v1, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move v0, p2

    .local v0, "j":I
    :goto_6
    if-eq v0, p3, :cond_10

    .line 91
    aget-object v2, p1, v0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 90
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 94
    :cond_10
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    return-object v2
.end method

.method private errorReport(Ljava/lang/Throwable;)Lorg/junit/runner/Request;
    .registers 3
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 108
    const-class v0, Lorg/junit/runner/JUnitCommandLineParseResult;

    invoke-static {v0, p1}, Lorg/junit/runner/Request;->errorReport(Ljava/lang/Class;Ljava/lang/Throwable;)Lorg/junit/runner/Request;

    move-result-object v0

    return-object v0
.end method

.method public static parse([Ljava/lang/String;)Lorg/junit/runner/JUnitCommandLineParseResult;
    .registers 2
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 42
    new-instance v0, Lorg/junit/runner/JUnitCommandLineParseResult;

    invoke-direct {v0}, Lorg/junit/runner/JUnitCommandLineParseResult;-><init>()V

    .line 44
    .local v0, "result":Lorg/junit/runner/JUnitCommandLineParseResult;
    invoke-direct {v0, p0}, Lorg/junit/runner/JUnitCommandLineParseResult;->parseArgs([Ljava/lang/String;)V

    .line 46
    return-object v0
.end method

.method private parseArgs([Ljava/lang/String;)V
    .registers 3
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    .line 50
    invoke-virtual {p0, p1}, Lorg/junit/runner/JUnitCommandLineParseResult;->parseOptions([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/junit/runner/JUnitCommandLineParseResult;->parseParameters([Ljava/lang/String;)V

    .line 51
    return-void
.end method


# virtual methods
.method public createRequest(Lorg/junit/runner/Computer;)Lorg/junit/runner/Request;
    .registers 5
    .param p1, "computer"    # Lorg/junit/runner/Computer;

    .prologue
    .line 117
    iget-object v1, p0, Lorg/junit/runner/JUnitCommandLineParseResult;->parserErrors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_21

    .line 118
    iget-object v1, p0, Lorg/junit/runner/JUnitCommandLineParseResult;->classes:Ljava/util/List;

    iget-object v2, p0, Lorg/junit/runner/JUnitCommandLineParseResult;->classes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/Class;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Class;

    invoke-static {p1, v1}, Lorg/junit/runner/Request;->classes(Lorg/junit/runner/Computer;[Ljava/lang/Class;)Lorg/junit/runner/Request;

    move-result-object v0

    .line 120
    .local v0, "request":Lorg/junit/runner/Request;
    invoke-direct {p0, v0}, Lorg/junit/runner/JUnitCommandLineParseResult;->applyFilterSpecs(Lorg/junit/runner/Request;)Lorg/junit/runner/Request;

    move-result-object v1

    .line 122
    .end local v0    # "request":Lorg/junit/runner/Request;
    :goto_20
    return-object v1

    :cond_21
    new-instance v1, Lorg/junit/runners/model/InitializationError;

    iget-object v2, p0, Lorg/junit/runner/JUnitCommandLineParseResult;->parserErrors:Ljava/util/List;

    invoke-direct {v1, v2}, Lorg/junit/runners/model/InitializationError;-><init>(Ljava/util/List;)V

    invoke-direct {p0, v1}, Lorg/junit/runner/JUnitCommandLineParseResult;->errorReport(Ljava/lang/Throwable;)Lorg/junit/runner/Request;

    move-result-object v1

    goto :goto_20
.end method

.method public getClasses()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 33
    iget-object v0, p0, Lorg/junit/runner/JUnitCommandLineParseResult;->classes:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getFilterSpecs()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 26
    iget-object v0, p0, Lorg/junit/runner/JUnitCommandLineParseResult;->filterSpecs:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method varargs parseOptions([Ljava/lang/String;)[Ljava/lang/String;
    .registers 9
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    .line 54
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v3, p1

    if-eq v2, v3, :cond_62

    .line 55
    aget-object v0, p1, v2

    .line 57
    .local v0, "arg":Ljava/lang/String;
    const-string v3, "--"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_16

    .line 58
    add-int/lit8 v3, v2, 0x1

    array-length v4, p1

    invoke-direct {p0, p1, v3, v4}, Lorg/junit/runner/JUnitCommandLineParseResult;->copyArray([Ljava/lang/String;II)[Ljava/lang/String;

    move-result-object v3

    .line 84
    .end local v0    # "arg":Ljava/lang/String;
    :goto_15
    return-object v3

    .line 59
    .restart local v0    # "arg":Ljava/lang/String;
    :cond_16
    const-string v3, "--"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_97

    .line 60
    const-string v3, "--filter="

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2e

    const-string v3, "--filter"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_73

    .line 62
    :cond_2e
    const-string v3, "--filter"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_66

    .line 63
    add-int/lit8 v2, v2, 0x1

    .line 65
    array-length v3, p1

    if-ge v2, v3, :cond_45

    .line 66
    aget-object v1, p1, v2

    .line 75
    .local v1, "filterSpec":Ljava/lang/String;
    :goto_3d
    iget-object v3, p0, Lorg/junit/runner/JUnitCommandLineParseResult;->filterSpecs:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    .end local v1    # "filterSpec":Ljava/lang/String;
    :goto_42
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 68
    :cond_45
    iget-object v3, p0, Lorg/junit/runner/JUnitCommandLineParseResult;->parserErrors:Ljava/util/List;

    new-instance v4, Lorg/junit/runner/JUnitCommandLineParseResult$CommandLineParserError;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " value not specified"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/junit/runner/JUnitCommandLineParseResult$CommandLineParserError;-><init>(Ljava/lang/String;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    .end local v0    # "arg":Ljava/lang/String;
    :cond_62
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/String;

    goto :goto_15

    .line 72
    .restart local v0    # "arg":Ljava/lang/String;
    :cond_66
    const/16 v3, 0x3d

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "filterSpec":Ljava/lang/String;
    goto :goto_3d

    .line 77
    .end local v1    # "filterSpec":Ljava/lang/String;
    :cond_73
    iget-object v3, p0, Lorg/junit/runner/JUnitCommandLineParseResult;->parserErrors:Ljava/util/List;

    new-instance v4, Lorg/junit/runner/JUnitCommandLineParseResult$CommandLineParserError;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "JUnit knows nothing about the "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " option"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/junit/runner/JUnitCommandLineParseResult$CommandLineParserError;-><init>(Ljava/lang/String;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_42

    .line 80
    :cond_97
    array-length v3, p1

    invoke-direct {p0, p1, v2, v3}, Lorg/junit/runner/JUnitCommandLineParseResult;->copyArray([Ljava/lang/String;II)[Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_15
.end method

.method parseParameters([Ljava/lang/String;)V
    .registers 11
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    .line 98
    move-object v1, p1

    .local v1, "arr$":[Ljava/lang/String;
    array-length v4, v1

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_3
    if-ge v3, v4, :cond_38

    aget-object v0, v1, v3

    .line 100
    .local v0, "arg":Ljava/lang/String;
    :try_start_7
    iget-object v5, p0, Lorg/junit/runner/JUnitCommandLineParseResult;->classes:Ljava/util/List;

    invoke-static {v0}, Lorg/junit/internal/Classes;->getClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_10
    .catch Ljava/lang/ClassNotFoundException; {:try_start_7 .. :try_end_10} :catch_13

    .line 98
    :goto_10
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 101
    :catch_13
    move-exception v2

    .line 102
    .local v2, "e":Ljava/lang/ClassNotFoundException;
    iget-object v5, p0, Lorg/junit/runner/JUnitCommandLineParseResult;->parserErrors:Ljava/util/List;

    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Could not find class ["

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "]"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_10

    .line 105
    .end local v0    # "arg":Ljava/lang/String;
    .end local v2    # "e":Ljava/lang/ClassNotFoundException;
    :cond_38
    return-void
.end method
