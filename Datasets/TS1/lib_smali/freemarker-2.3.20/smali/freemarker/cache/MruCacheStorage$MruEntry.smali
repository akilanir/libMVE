.class final Lfreemarker/cache/MruCacheStorage$MruEntry;
.super Ljava/lang/Object;
.source "MruCacheStorage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/cache/MruCacheStorage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MruEntry"
.end annotation


# instance fields
.field private final key:Ljava/lang/Object;

.field private next:Lfreemarker/cache/MruCacheStorage$MruEntry;

.field private prev:Lfreemarker/cache/MruCacheStorage$MruEntry;

.field private value:Ljava/lang/Object;


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 253
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 254
    invoke-virtual {p0}, Lfreemarker/cache/MruCacheStorage$MruEntry;->makeHead()V

    .line 255
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/cache/MruCacheStorage$MruEntry;->value:Ljava/lang/Object;

    iput-object v0, p0, Lfreemarker/cache/MruCacheStorage$MruEntry;->key:Ljava/lang/Object;

    .line 256
    return-void
.end method

.method constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 258
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 259
    iput-object p1, p0, Lfreemarker/cache/MruCacheStorage$MruEntry;->key:Ljava/lang/Object;

    .line 260
    iput-object p2, p0, Lfreemarker/cache/MruCacheStorage$MruEntry;->value:Ljava/lang/Object;

    .line 261
    return-void
.end method


# virtual methods
.method getKey()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 264
    iget-object v0, p0, Lfreemarker/cache/MruCacheStorage$MruEntry;->key:Ljava/lang/Object;

    return-object v0
.end method

.method getPrevious()Lfreemarker/cache/MruCacheStorage$MruEntry;
    .registers 2

    .prologue
    .line 276
    iget-object v0, p0, Lfreemarker/cache/MruCacheStorage$MruEntry;->prev:Lfreemarker/cache/MruCacheStorage$MruEntry;

    return-object v0
.end method

.method getValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 268
    iget-object v0, p0, Lfreemarker/cache/MruCacheStorage$MruEntry;->value:Ljava/lang/Object;

    return-object v0
.end method

.method linkAfter(Lfreemarker/cache/MruCacheStorage$MruEntry;)V
    .registers 3
    .param p1, "entry"    # Lfreemarker/cache/MruCacheStorage$MruEntry;

    .prologue
    .line 280
    iget-object v0, p1, Lfreemarker/cache/MruCacheStorage$MruEntry;->next:Lfreemarker/cache/MruCacheStorage$MruEntry;

    iput-object v0, p0, Lfreemarker/cache/MruCacheStorage$MruEntry;->next:Lfreemarker/cache/MruCacheStorage$MruEntry;

    .line 281
    iput-object p0, p1, Lfreemarker/cache/MruCacheStorage$MruEntry;->next:Lfreemarker/cache/MruCacheStorage$MruEntry;

    .line 282
    iput-object p1, p0, Lfreemarker/cache/MruCacheStorage$MruEntry;->prev:Lfreemarker/cache/MruCacheStorage$MruEntry;

    .line 283
    iget-object v0, p0, Lfreemarker/cache/MruCacheStorage$MruEntry;->next:Lfreemarker/cache/MruCacheStorage$MruEntry;

    iput-object p0, v0, Lfreemarker/cache/MruCacheStorage$MruEntry;->prev:Lfreemarker/cache/MruCacheStorage$MruEntry;

    .line 284
    return-void
.end method

.method makeHead()V
    .registers 1

    .prologue
    .line 294
    iput-object p0, p0, Lfreemarker/cache/MruCacheStorage$MruEntry;->next:Lfreemarker/cache/MruCacheStorage$MruEntry;

    iput-object p0, p0, Lfreemarker/cache/MruCacheStorage$MruEntry;->prev:Lfreemarker/cache/MruCacheStorage$MruEntry;

    .line 295
    return-void
.end method

.method setValue(Ljava/lang/Object;)V
    .registers 2
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 272
    iput-object p1, p0, Lfreemarker/cache/MruCacheStorage$MruEntry;->value:Ljava/lang/Object;

    .line 273
    return-void
.end method

.method unlink()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 287
    iget-object v0, p0, Lfreemarker/cache/MruCacheStorage$MruEntry;->next:Lfreemarker/cache/MruCacheStorage$MruEntry;

    iget-object v1, p0, Lfreemarker/cache/MruCacheStorage$MruEntry;->prev:Lfreemarker/cache/MruCacheStorage$MruEntry;

    iput-object v1, v0, Lfreemarker/cache/MruCacheStorage$MruEntry;->prev:Lfreemarker/cache/MruCacheStorage$MruEntry;

    .line 288
    iget-object v0, p0, Lfreemarker/cache/MruCacheStorage$MruEntry;->prev:Lfreemarker/cache/MruCacheStorage$MruEntry;

    iget-object v1, p0, Lfreemarker/cache/MruCacheStorage$MruEntry;->next:Lfreemarker/cache/MruCacheStorage$MruEntry;

    iput-object v1, v0, Lfreemarker/cache/MruCacheStorage$MruEntry;->next:Lfreemarker/cache/MruCacheStorage$MruEntry;

    .line 289
    iput-object v2, p0, Lfreemarker/cache/MruCacheStorage$MruEntry;->prev:Lfreemarker/cache/MruCacheStorage$MruEntry;

    .line 290
    iput-object v2, p0, Lfreemarker/cache/MruCacheStorage$MruEntry;->next:Lfreemarker/cache/MruCacheStorage$MruEntry;

    .line 291
    return-void
.end method
