.class public Lorg/markdownj/CharacterProtector;
.super Ljava/lang/Object;
.source "CharacterProtector.java"


# static fields
.field private static final GOOD_CHARS:Ljava/lang/String; = "0123456789qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM"


# instance fields
.field private final protectMap:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private rnd:Ljava/util/Random;

.field private final unprotectMap:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/markdownj/CharacterProtector;->protectMap:Ljava/util/concurrent/ConcurrentMap;

    .line 46
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/markdownj/CharacterProtector;->unprotectMap:Ljava/util/concurrent/ConcurrentMap;

    .line 48
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lorg/markdownj/CharacterProtector;->rnd:Ljava/util/Random;

    return-void
.end method

.method private addToken(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "literal"    # Ljava/lang/String;

    .prologue
    .line 73
    invoke-direct {p0}, Lorg/markdownj/CharacterProtector;->longRandomString()Ljava/lang/String;

    move-result-object v0

    .line 75
    .local v0, "encoded":Ljava/lang/String;
    iget-object v1, p0, Lorg/markdownj/CharacterProtector;->protectMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1, p1, v0}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    iget-object v1, p0, Lorg/markdownj/CharacterProtector;->unprotectMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1, v0, p1}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    return-object v0
.end method

.method private longRandomString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 82
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 83
    .local v2, "sb":Ljava/lang/StringBuilder;
    const-string v3, "0123456789qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v0

    .line 84
    .local v0, "CHAR_MAX":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    const/16 v3, 0x14

    if-ge v1, v3, :cond_22

    .line 85
    const-string v3, "0123456789qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM"

    iget-object v4, p0, Lorg/markdownj/CharacterProtector;->rnd:Ljava/util/Random;

    invoke-virtual {v4, v0}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 84
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 87
    :cond_22
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method


# virtual methods
.method public decode(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "coded"    # Ljava/lang/String;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/markdownj/CharacterProtector;->unprotectMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public encode(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "literal"    # Ljava/lang/String;

    .prologue
    .line 52
    iget-object v2, p0, Lorg/markdownj/CharacterProtector;->protectMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 53
    .local v1, "encoded":Ljava/lang/String;
    if-nez v1, :cond_1e

    .line 54
    iget-object v3, p0, Lorg/markdownj/CharacterProtector;->protectMap:Ljava/util/concurrent/ConcurrentMap;

    monitor-enter v3

    .line 55
    :try_start_d
    iget-object v2, p0, Lorg/markdownj/CharacterProtector;->protectMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Ljava/lang/String;

    move-object v1, v0

    .line 56
    if-nez v1, :cond_1d

    .line 57
    invoke-direct {p0, p1}, Lorg/markdownj/CharacterProtector;->addToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 59
    :cond_1d
    monitor-exit v3

    .line 61
    :cond_1e
    return-object v1

    .line 59
    :catchall_1f
    move-exception v2

    monitor-exit v3
    :try_end_21
    .catchall {:try_start_d .. :try_end_21} :catchall_1f

    throw v2
.end method

.method public getAllEncodedTokens()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 69
    iget-object v0, p0, Lorg/markdownj/CharacterProtector;->unprotectMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lorg/markdownj/CharacterProtector;->protectMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
