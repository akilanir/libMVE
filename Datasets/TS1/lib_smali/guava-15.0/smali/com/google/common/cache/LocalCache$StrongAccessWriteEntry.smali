.class final Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;
.super Lcom/google/common/cache/LocalCache$StrongEntry;
.source "LocalCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/LocalCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "StrongAccessWriteEntry"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/cache/LocalCache$StrongEntry",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field volatile accessTime:J

.field nextAccess:Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation
.end field

.field nextWrite:Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation
.end field

.field previousAccess:Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation
.end field

.field previousWrite:Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation
.end field

.field volatile writeTime:J


# direct methods
.method constructor <init>(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ReferenceEntry;)V
    .registers 7
    .param p2, "hash"    # I
    .param p3    # Lcom/google/common/cache/LocalCache$ReferenceEntry;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;, "Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "next":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    const-wide v1, 0x7fffffffffffffffL

    .line 1200
    invoke-direct {p0, p1, p2, p3}, Lcom/google/common/cache/LocalCache$StrongEntry;-><init>(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ReferenceEntry;)V

    .line 1205
    iput-wide v1, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->accessTime:J

    .line 1217
    invoke-static {}, Lcom/google/common/cache/LocalCache;->nullEntry()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->nextAccess:Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 1230
    invoke-static {}, Lcom/google/common/cache/LocalCache;->nullEntry()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->previousAccess:Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 1245
    iput-wide v1, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->writeTime:J

    .line 1257
    invoke-static {}, Lcom/google/common/cache/LocalCache;->nullEntry()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->nextWrite:Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 1270
    invoke-static {}, Lcom/google/common/cache/LocalCache;->nullEntry()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->previousWrite:Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 1201
    return-void
.end method


# virtual methods
.method public getAccessTime()J
    .registers 3

    .prologue
    .line 1209
    .local p0, "this":Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;, "Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry<TK;TV;>;"
    iget-wide v0, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->accessTime:J

    return-wide v0
.end method

.method public getNextInAccessQueue()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 1222
    .local p0, "this":Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;, "Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->nextAccess:Lcom/google/common/cache/LocalCache$ReferenceEntry;

    return-object v0
.end method

.method public getNextInWriteQueue()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 1262
    .local p0, "this":Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;, "Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->nextWrite:Lcom/google/common/cache/LocalCache$ReferenceEntry;

    return-object v0
.end method

.method public getPreviousInAccessQueue()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 1235
    .local p0, "this":Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;, "Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->previousAccess:Lcom/google/common/cache/LocalCache$ReferenceEntry;

    return-object v0
.end method

.method public getPreviousInWriteQueue()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 1275
    .local p0, "this":Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;, "Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->previousWrite:Lcom/google/common/cache/LocalCache$ReferenceEntry;

    return-object v0
.end method

.method public getWriteTime()J
    .registers 3

    .prologue
    .line 1249
    .local p0, "this":Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;, "Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry<TK;TV;>;"
    iget-wide v0, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->writeTime:J

    return-wide v0
.end method

.method public setAccessTime(J)V
    .registers 3
    .param p1, "time"    # J

    .prologue
    .line 1214
    .local p0, "this":Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;, "Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry<TK;TV;>;"
    iput-wide p1, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->accessTime:J

    .line 1215
    return-void
.end method

.method public setNextInAccessQueue(Lcom/google/common/cache/LocalCache$ReferenceEntry;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 1227
    .local p0, "this":Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;, "Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry<TK;TV;>;"
    .local p1, "next":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->nextAccess:Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 1228
    return-void
.end method

.method public setNextInWriteQueue(Lcom/google/common/cache/LocalCache$ReferenceEntry;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 1267
    .local p0, "this":Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;, "Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry<TK;TV;>;"
    .local p1, "next":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->nextWrite:Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 1268
    return-void
.end method

.method public setPreviousInAccessQueue(Lcom/google/common/cache/LocalCache$ReferenceEntry;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 1240
    .local p0, "this":Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;, "Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry<TK;TV;>;"
    .local p1, "previous":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->previousAccess:Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 1241
    return-void
.end method

.method public setPreviousInWriteQueue(Lcom/google/common/cache/LocalCache$ReferenceEntry;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 1280
    .local p0, "this":Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;, "Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry<TK;TV;>;"
    .local p1, "previous":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->previousWrite:Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 1281
    return-void
.end method

.method public setWriteTime(J)V
    .registers 3
    .param p1, "time"    # J

    .prologue
    .line 1254
    .local p0, "this":Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;, "Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry<TK;TV;>;"
    iput-wide p1, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->writeTime:J

    .line 1255
    return-void
.end method
