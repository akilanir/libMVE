.class public final Lcom/facebook/stetho/inspector/elements/Document;
.super Lcom/facebook/stetho/inspector/helper/ThreadBoundProxy;
.source "Document.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;,
        Lcom/facebook/stetho/inspector/elements/Document$ProviderListener;,
        Lcom/facebook/stetho/inspector/elements/Document$DocumentObjectIdMapper;,
        Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;,
        Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;,
        Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;
    }
.end annotation


# instance fields
.field private mCachedAttributeAccumulator:Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;

.field private mCachedChildEventingList:Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;

.field private mCachedChildrenAccumulator:Lcom/facebook/stetho/common/ArrayListAccumulator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/stetho/common/ArrayListAccumulator",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final mCachedUpdateQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

.field private final mFactory:Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;

.field private final mObjectIdMapper:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

.field private mReferenceCounter:I
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private mShadowDocument:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

.field private mUpdateListeners:Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;


# direct methods
.method public constructor <init>(Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;)V
    .registers 4
    .param p1, "factory"    # Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/helper/ThreadBoundProxy;-><init>(Lcom/facebook/stetho/common/ThreadBound;)V

    .line 48
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mFactory:Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;

    .line 49
    new-instance v0, Lcom/facebook/stetho/inspector/elements/Document$DocumentObjectIdMapper;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/facebook/stetho/inspector/elements/Document$DocumentObjectIdMapper;-><init>(Lcom/facebook/stetho/inspector/elements/Document;Lcom/facebook/stetho/inspector/elements/Document$1;)V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mObjectIdMapper:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    .line 50
    const/4 v0, 0x0

    iput v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mReferenceCounter:I

    .line 51
    new-instance v0, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;

    invoke-direct {v0, p0}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;-><init>(Lcom/facebook/stetho/inspector/elements/Document;)V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mUpdateListeners:Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;

    .line 52
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedUpdateQueue:Ljava/util/Queue;

    .line 53
    return-void
.end method

.method static synthetic access$100(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/elements/ShadowDocument;
    .registers 2
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mShadowDocument:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;Ljava/util/List;Lcom/facebook/stetho/common/Accumulator;)V
    .registers 3
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Lcom/facebook/stetho/common/Accumulator;

    .prologue
    .line 30
    invoke-static {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/Document;->updateListenerChildren(Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;Ljava/util/List;Lcom/facebook/stetho/common/Accumulator;)V

    return-void
.end method

.method static synthetic access$102(Lcom/facebook/stetho/inspector/elements/Document;Lcom/facebook/stetho/inspector/elements/ShadowDocument;)Lcom/facebook/stetho/inspector/elements/ShadowDocument;
    .registers 2
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;
    .param p1, "x1"    # Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mShadowDocument:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/facebook/stetho/inspector/elements/Document;Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;)V
    .registers 2
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;
    .param p1, "x1"    # Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/elements/Document;->releaseChildEventingList(Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/facebook/stetho/inspector/elements/Document;)V
    .registers 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/Document;->updateTree()V

    return-void
.end method

.method static synthetic access$200(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/elements/DocumentProvider;
    .registers 2
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    return-object v0
.end method

.method static synthetic access$202(Lcom/facebook/stetho/inspector/elements/Document;Lcom/facebook/stetho/inspector/elements/DocumentProvider;)Lcom/facebook/stetho/inspector/elements/DocumentProvider;
    .registers 2
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;
    .param p1, "x1"    # Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    return-object p1
.end method

.method static synthetic access$300(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;
    .registers 2
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/Document;->createShadowDocumentUpdate()Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;
    .registers 2
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mObjectIdMapper:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    return-object v0
.end method

.method static synthetic access$700(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;
    .registers 2
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mUpdateListeners:Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;

    return-object v0
.end method

.method static synthetic access$900(Lcom/facebook/stetho/inspector/elements/Document;Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/DocumentView;)Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;
    .registers 4
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;
    .param p1, "x1"    # Ljava/lang/Object;
    .param p2, "x2"    # Lcom/facebook/stetho/inspector/elements/DocumentView;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/Document;->acquireChildEventingList(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/DocumentView;)Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;

    move-result-object v0

    return-object v0
.end method

.method private acquireCachedAttributeAccumulator()Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;
    .registers 3

    .prologue
    .line 237
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedAttributeAccumulator:Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;

    .line 239
    .local v0, "accumulator":Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;
    if-nez v0, :cond_9

    .line 240
    new-instance v0, Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;

    .end local v0    # "accumulator":Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;
    invoke-direct {v0}, Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;-><init>()V

    .line 243
    .restart local v0    # "accumulator":Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;
    :cond_9
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedChildrenAccumulator:Lcom/facebook/stetho/common/ArrayListAccumulator;

    .line 245
    return-object v0
.end method

.method private acquireChildEventingList(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/DocumentView;)Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;
    .registers 5
    .param p1, "parentElement"    # Ljava/lang/Object;
    .param p2, "documentView"    # Lcom/facebook/stetho/inspector/elements/DocumentView;

    .prologue
    const/4 v1, 0x0

    .line 217
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedChildEventingList:Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;

    .line 219
    .local v0, "childEventingList":Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;
    if-nez v0, :cond_a

    .line 220
    new-instance v0, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;

    .end local v0    # "childEventingList":Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;
    invoke-direct {v0, p0, v1}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;-><init>(Lcom/facebook/stetho/inspector/elements/Document;Lcom/facebook/stetho/inspector/elements/Document$1;)V

    .line 223
    .restart local v0    # "childEventingList":Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;
    :cond_a
    iput-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedChildEventingList:Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;

    .line 225
    invoke-virtual {v0, p1, p2}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->acquire(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/DocumentView;)V

    .line 226
    return-object v0
.end method

.method private acquireChildrenAccumulator()Lcom/facebook/stetho/common/ArrayListAccumulator;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/stetho/common/ArrayListAccumulator",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 257
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedChildrenAccumulator:Lcom/facebook/stetho/common/ArrayListAccumulator;

    .line 258
    .local v0, "accumulator":Lcom/facebook/stetho/common/ArrayListAccumulator;, "Lcom/facebook/stetho/common/ArrayListAccumulator<Ljava/lang/Object;>;"
    if-nez v0, :cond_9

    .line 259
    new-instance v0, Lcom/facebook/stetho/common/ArrayListAccumulator;

    .end local v0    # "accumulator":Lcom/facebook/stetho/common/ArrayListAccumulator;, "Lcom/facebook/stetho/common/ArrayListAccumulator<Ljava/lang/Object;>;"
    invoke-direct {v0}, Lcom/facebook/stetho/common/ArrayListAccumulator;-><init>()V

    .line 261
    .restart local v0    # "accumulator":Lcom/facebook/stetho/common/ArrayListAccumulator;, "Lcom/facebook/stetho/common/ArrayListAccumulator<Ljava/lang/Object;>;"
    :cond_9
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedChildrenAccumulator:Lcom/facebook/stetho/common/ArrayListAccumulator;

    .line 262
    return-object v0
.end method

.method private applyDocumentUpdate(Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;)V
    .registers 3
    .param p1, "docUpdate"    # Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;

    .prologue
    .line 345
    new-instance v0, Lcom/facebook/stetho/inspector/elements/Document$3;

    invoke-direct {v0, p0, p1}, Lcom/facebook/stetho/inspector/elements/Document$3;-><init>(Lcom/facebook/stetho/inspector/elements/Document;Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;)V

    invoke-virtual {p1, v0}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->getGarbageElements(Lcom/facebook/stetho/common/Accumulator;)V

    .line 372
    new-instance v0, Lcom/facebook/stetho/inspector/elements/Document$4;

    invoke-direct {v0, p0, p1}, Lcom/facebook/stetho/inspector/elements/Document$4;-><init>(Lcom/facebook/stetho/inspector/elements/Document;Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;)V

    invoke-virtual {p1, v0}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->getChangedElements(Lcom/facebook/stetho/common/Accumulator;)V

    .line 397
    new-instance v0, Lcom/facebook/stetho/inspector/elements/Document$5;

    invoke-direct {v0, p0, p1}, Lcom/facebook/stetho/inspector/elements/Document$5;-><init>(Lcom/facebook/stetho/inspector/elements/Document;Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;)V

    invoke-virtual {p1, v0}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->getChangedElements(Lcom/facebook/stetho/common/Accumulator;)V

    .line 456
    invoke-virtual {p1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->commit()V

    .line 457
    return-void
.end method

.method private cleanUp()V
    .registers 3

    .prologue
    .line 84
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    new-instance v1, Lcom/facebook/stetho/inspector/elements/Document$2;

    invoke-direct {v1, p0}, Lcom/facebook/stetho/inspector/elements/Document$2;-><init>(Lcom/facebook/stetho/inspector/elements/Document;)V

    invoke-interface {v0, v1}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->postAndWait(Ljava/lang/Runnable;)V

    .line 95
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mUpdateListeners:Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;

    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->clear()V

    .line 96
    return-void
.end method

.method private createShadowDocumentUpdate()Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;
    .registers 12

    .prologue
    .line 273
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document;->verifyThreadAccess()V

    .line 275
    iget-object v7, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v7}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->getRootElement()Ljava/lang/Object;

    move-result-object v7

    iget-object v8, p0, Lcom/facebook/stetho/inspector/elements/Document;->mShadowDocument:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-virtual {v8}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->getRootElement()Ljava/lang/Object;

    move-result-object v8

    if-eq v7, v8, :cond_17

    .line 276
    new-instance v7, Ljava/lang/IllegalStateException;

    invoke-direct {v7}, Ljava/lang/IllegalStateException;-><init>()V

    throw v7

    .line 279
    :cond_17
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/Document;->acquireChildrenAccumulator()Lcom/facebook/stetho/common/ArrayListAccumulator;

    move-result-object v1

    .line 281
    .local v1, "childrenAccumulator":Lcom/facebook/stetho/common/ArrayListAccumulator;, "Lcom/facebook/stetho/common/ArrayListAccumulator<Ljava/lang/Object;>;"
    iget-object v7, p0, Lcom/facebook/stetho/inspector/elements/Document;->mShadowDocument:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-virtual {v7}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->beginUpdate()Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;

    move-result-object v6

    .line 282
    .local v6, "updateBuilder":Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;
    iget-object v7, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedUpdateQueue:Ljava/util/Queue;

    iget-object v8, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v8}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->getRootElement()Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 284
    :goto_2c
    iget-object v7, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedUpdateQueue:Ljava/util/Queue;

    invoke-interface {v7}, Ljava/util/Queue;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_89

    .line 285
    iget-object v7, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedUpdateQueue:Ljava/util/Queue;

    invoke-interface {v7}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v3

    .line 286
    .local v3, "element":Ljava/lang/Object;
    iget-object v7, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v7, v3}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->getNodeDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeDescriptor;

    move-result-object v2

    .line 287
    .local v2, "descriptor":Lcom/facebook/stetho/inspector/elements/NodeDescriptor;
    iget-object v7, p0, Lcom/facebook/stetho/inspector/elements/Document;->mObjectIdMapper:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    invoke-virtual {v7, v3}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->putObject(Ljava/lang/Object;)I

    .line 288
    invoke-interface {v2, v3, v1}, Lcom/facebook/stetho/inspector/elements/NodeDescriptor;->getChildren(Ljava/lang/Object;Lcom/facebook/stetho/common/Accumulator;)V

    .line 290
    const/4 v4, 0x0

    .local v4, "i":I
    invoke-virtual {v1}, Lcom/facebook/stetho/common/ArrayListAccumulator;->size()I

    move-result v5

    .local v5, "size":I
    :goto_4d
    if-ge v4, v5, :cond_82

    .line 291
    invoke-virtual {v1, v4}, Lcom/facebook/stetho/common/ArrayListAccumulator;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 292
    .local v0, "child":Ljava/lang/Object;
    if-eqz v0, :cond_5d

    .line 293
    iget-object v7, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedUpdateQueue:Ljava/util/Queue;

    invoke-interface {v7, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 290
    :goto_5a
    add-int/lit8 v4, v4, 0x1

    goto :goto_4d

    .line 298
    :cond_5d
    const-string v7, "%s.getChildren() emitted a null child at position %s for element %s"

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    .line 300
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    .line 301
    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x2

    aput-object v3, v8, v9

    .line 298
    invoke-static {v7, v8}, Lcom/facebook/stetho/common/LogUtil;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 304
    invoke-virtual {v1, v4}, Lcom/facebook/stetho/common/ArrayListAccumulator;->remove(I)Ljava/lang/Object;

    .line 305
    add-int/lit8 v4, v4, -0x1

    .line 306
    add-int/lit8 v5, v5, -0x1

    goto :goto_5a

    .line 310
    .end local v0    # "child":Ljava/lang/Object;
    :cond_82
    invoke-virtual {v6, v3, v1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->setElementChildren(Ljava/lang/Object;Ljava/util/List;)V

    .line 311
    invoke-virtual {v1}, Lcom/facebook/stetho/common/ArrayListAccumulator;->clear()V

    goto :goto_2c

    .line 314
    .end local v2    # "descriptor":Lcom/facebook/stetho/inspector/elements/NodeDescriptor;
    .end local v3    # "element":Ljava/lang/Object;
    .end local v4    # "i":I
    .end local v5    # "size":I
    :cond_89
    invoke-direct {p0, v1}, Lcom/facebook/stetho/inspector/elements/Document;->releaseChildrenAccumulator(Lcom/facebook/stetho/common/ArrayListAccumulator;)V

    .line 316
    invoke-virtual {v6}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->build()Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;

    move-result-object v7

    return-object v7
.end method

.method private doesElementMatch(Ljava/lang/Object;Ljava/util/regex/Pattern;)Z
    .registers 8
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "queryPattern"    # Ljava/util/regex/Pattern;

    .prologue
    .line 198
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/Document;->acquireCachedAttributeAccumulator()Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;

    move-result-object v1

    .line 199
    .local v1, "accumulator":Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v4, p1}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->getNodeDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeDescriptor;

    move-result-object v2

    .line 201
    .local v2, "descriptor":Lcom/facebook/stetho/inspector/elements/NodeDescriptor;
    invoke-interface {v2, p1, v1}, Lcom/facebook/stetho/inspector/elements/NodeDescriptor;->getAttributes(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;)V

    .line 203
    const/4 v3, 0x0

    .local v3, "i":I
    invoke-virtual {v1}, Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;->size()I

    move-result v0

    .local v0, "N":I
    :goto_12
    if-ge v3, v0, :cond_2c

    .line 204
    invoke-virtual {v1, v3}, Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    invoke-virtual {p2, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_29

    .line 205
    invoke-direct {p0, v1}, Lcom/facebook/stetho/inspector/elements/Document;->releaseCachedAttributeAccumulator(Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;)V

    .line 206
    const/4 v4, 0x1

    .line 211
    :goto_28
    return v4

    .line 203
    :cond_29
    add-int/lit8 v3, v3, 0x1

    goto :goto_12

    .line 210
    :cond_2c
    invoke-direct {p0, v1}, Lcom/facebook/stetho/inspector/elements/Document;->releaseCachedAttributeAccumulator(Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;)V

    .line 211
    invoke-interface {v2, p1}, Lcom/facebook/stetho/inspector/elements/NodeDescriptor;->getNodeName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    goto :goto_28
.end method

.method private findMatches(Ljava/lang/Object;Ljava/util/regex/Pattern;Lcom/facebook/stetho/common/Accumulator;)V
    .registers 9
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "queryPattern"    # Ljava/util/regex/Pattern;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/regex/Pattern;",
            "Lcom/facebook/stetho/common/Accumulator",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 184
    .local p3, "matchedIds":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Integer;>;"
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/Document;->mShadowDocument:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-virtual {v4, p1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->getElementInfo(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/ElementInfo;

    move-result-object v2

    .line 186
    .local v2, "info":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    const/4 v1, 0x0

    .local v1, "i":I
    iget-object v4, v2, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .local v3, "size":I
    :goto_d
    if-ge v1, v3, :cond_2a

    .line 187
    iget-object v4, v2, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 189
    .local v0, "childElement":Ljava/lang/Object;
    invoke-direct {p0, v0, p2}, Lcom/facebook/stetho/inspector/elements/Document;->doesElementMatch(Ljava/lang/Object;Ljava/util/regex/Pattern;)Z

    move-result v4

    if-eqz v4, :cond_24

    .line 190
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/Document;->mObjectIdMapper:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    invoke-virtual {v4, v0}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->getIdForObject(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {p3, v4}, Lcom/facebook/stetho/common/Accumulator;->store(Ljava/lang/Object;)V

    .line 193
    :cond_24
    invoke-direct {p0, v0, p2, p3}, Lcom/facebook/stetho/inspector/elements/Document;->findMatches(Ljava/lang/Object;Ljava/util/regex/Pattern;Lcom/facebook/stetho/common/Accumulator;)V

    .line 186
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 195
    .end local v0    # "childElement":Ljava/lang/Object;
    :cond_2a
    return-void
.end method

.method private init()V
    .registers 3

    .prologue
    .line 70
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mFactory:Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;

    invoke-interface {v0}, Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;->create()Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    .line 72
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    new-instance v1, Lcom/facebook/stetho/inspector/elements/Document$1;

    invoke-direct {v1, p0}, Lcom/facebook/stetho/inspector/elements/Document$1;-><init>(Lcom/facebook/stetho/inspector/elements/Document;)V

    invoke-interface {v0, v1}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->postAndWait(Ljava/lang/Runnable;)V

    .line 81
    return-void
.end method

.method private releaseCachedAttributeAccumulator(Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;)V
    .registers 3
    .param p1, "accumulator"    # Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;

    .prologue
    .line 249
    invoke-virtual {p1}, Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;->clear()V

    .line 251
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedAttributeAccumulator:Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;

    if-nez v0, :cond_9

    .line 252
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedAttributeAccumulator:Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;

    .line 254
    :cond_9
    return-void
.end method

.method private releaseChildEventingList(Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;)V
    .registers 3
    .param p1, "childEventingList"    # Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;

    .prologue
    .line 230
    invoke-virtual {p1}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->release()V

    .line 231
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedChildEventingList:Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;

    if-nez v0, :cond_9

    .line 232
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedChildEventingList:Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;

    .line 234
    :cond_9
    return-void
.end method

.method private releaseChildrenAccumulator(Lcom/facebook/stetho/common/ArrayListAccumulator;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/stetho/common/ArrayListAccumulator",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 266
    .local p1, "accumulator":Lcom/facebook/stetho/common/ArrayListAccumulator;, "Lcom/facebook/stetho/common/ArrayListAccumulator<Ljava/lang/Object;>;"
    invoke-virtual {p1}, Lcom/facebook/stetho/common/ArrayListAccumulator;->clear()V

    .line 267
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedChildrenAccumulator:Lcom/facebook/stetho/common/ArrayListAccumulator;

    if-nez v0, :cond_9

    .line 268
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedChildrenAccumulator:Lcom/facebook/stetho/common/ArrayListAccumulator;

    .line 270
    :cond_9
    return-void
.end method

.method private static updateListenerChildren(Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;Ljava/util/List;Lcom/facebook/stetho/common/Accumulator;)V
    .registers 8
    .param p0, "listenerChildren"    # Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/facebook/stetho/common/Accumulator",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 463
    .local p1, "newChildren":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .local p2, "insertedElements":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    const/4 v0, 0x0

    .line 464
    .local v0, "index":I
    :goto_1
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->size()I

    move-result v4

    if-gt v0, v4, :cond_13

    .line 466
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->size()I

    move-result v4

    if-ne v0, v4, :cond_1e

    .line 467
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    if-ne v0, v4, :cond_14

    .line 510
    :cond_13
    return-void

    .line 471
    :cond_14
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 472
    .local v2, "newElement":Ljava/lang/Object;
    invoke-virtual {p0, v0, v2, p2}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->addWithEvent(ILjava/lang/Object;Lcom/facebook/stetho/common/Accumulator;)V

    .line 473
    add-int/lit8 v0, v0, 0x1

    .line 474
    goto :goto_1

    .line 478
    .end local v2    # "newElement":Ljava/lang/Object;
    :cond_1e
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    if-ne v0, v4, :cond_28

    .line 479
    invoke-virtual {p0, v0}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->removeWithEvent(I)V

    goto :goto_1

    .line 483
    :cond_28
    invoke-virtual {p0, v0}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 484
    .local v1, "listenerElement":Ljava/lang/Object;
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 487
    .restart local v2    # "newElement":Ljava/lang/Object;
    if-ne v1, v2, :cond_35

    .line 488
    add-int/lit8 v0, v0, 0x1

    .line 489
    goto :goto_1

    .line 492
    :cond_35
    invoke-virtual {p0, v2}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->indexOf(Ljava/lang/Object;)I

    move-result v3

    .line 493
    .local v3, "newElementListenerIndex":I
    const/4 v4, -0x1

    if-ne v3, v4, :cond_42

    .line 494
    invoke-virtual {p0, v0, v2, p2}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->addWithEvent(ILjava/lang/Object;Lcom/facebook/stetho/common/Accumulator;)V

    .line 495
    add-int/lit8 v0, v0, 0x1

    .line 496
    goto :goto_1

    .line 505
    :cond_42
    invoke-virtual {p0, v3}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->removeWithEvent(I)V

    .line 506
    invoke-virtual {p0, v0, v2, p2}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->addWithEvent(ILjava/lang/Object;Lcom/facebook/stetho/common/Accumulator;)V

    .line 508
    add-int/lit8 v0, v0, 0x1

    .line 509
    goto :goto_1
.end method

.method private updateTree()V
    .registers 11

    .prologue
    .line 320
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    .line 322
    .local v4, "startTimeMs":J
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/Document;->createShadowDocumentUpdate()Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;

    move-result-object v2

    .line 323
    .local v2, "docUpdate":Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;
    invoke-virtual {v2}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->isEmpty()Z

    move-result v3

    .line 324
    .local v3, "isEmpty":Z
    if-eqz v3, :cond_2e

    .line 325
    invoke-virtual {v2}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->abandon()V

    .line 330
    :goto_11
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    sub-long v0, v6, v4

    .line 331
    .local v0, "deltaMs":J
    const-string v7, "Document.updateTree() completed in %s ms%s"

    const/4 v6, 0x2

    new-array v8, v6, [Ljava/lang/Object;

    const/4 v6, 0x0

    .line 333
    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v6

    const/4 v9, 0x1

    if-eqz v3, :cond_32

    const-string v6, " (no changes)"

    :goto_28
    aput-object v6, v8, v9

    .line 331
    invoke-static {v7, v8}, Lcom/facebook/stetho/common/LogUtil;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 335
    return-void

    .line 327
    .end local v0    # "deltaMs":J
    :cond_2e
    invoke-direct {p0, v2}, Lcom/facebook/stetho/inspector/elements/Document;->applyDocumentUpdate(Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;)V

    goto :goto_11

    .line 333
    .restart local v0    # "deltaMs":J
    :cond_32
    const-string v6, ""

    goto :goto_28
.end method


# virtual methods
.method public declared-synchronized addRef()V
    .registers 3

    .prologue
    .line 56
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mReferenceCounter:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mReferenceCounter:I

    if-nez v0, :cond_c

    .line 57
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/Document;->init()V
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_e

    .line 59
    :cond_c
    monitor-exit p0

    return-void

    .line 56
    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public addUpdateListener(Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;)V
    .registers 3
    .param p1, "updateListener"    # Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;

    .prologue
    .line 99
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mUpdateListeners:Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->add(Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;)V

    .line 100
    return-void
.end method

.method public findMatchingElements(Ljava/lang/String;Lcom/facebook/stetho/common/Accumulator;)V
    .registers 7
    .param p1, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/facebook/stetho/common/Accumulator",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 175
    .local p2, "matchedIds":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document;->verifyThreadAccess()V

    .line 177
    invoke-static {p1}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    invoke-static {v2, v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 178
    .local v0, "queryPattern":Ljava/util/regex/Pattern;
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v2}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->getRootElement()Ljava/lang/Object;

    move-result-object v1

    .line 180
    .local v1, "rootElement":Ljava/lang/Object;
    invoke-direct {p0, v1, v0, p2}, Lcom/facebook/stetho/inspector/elements/Document;->findMatches(Ljava/lang/Object;Ljava/util/regex/Pattern;Lcom/facebook/stetho/common/Accumulator;)V

    .line 181
    return-void
.end method

.method public getDocumentView()Lcom/facebook/stetho/inspector/elements/DocumentView;
    .registers 2

    .prologue
    .line 150
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document;->verifyThreadAccess()V

    .line 151
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mShadowDocument:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    return-object v0
.end method

.method public getElementForNodeId(I)Ljava/lang/Object;
    .registers 3
    .param p1, "id"    # I
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 135
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mObjectIdMapper:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->getObjectForId(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getElementStyles(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V
    .registers 4
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "styleAccumulator"    # Lcom/facebook/stetho/inspector/elements/StyleAccumulator;

    .prologue
    .line 144
    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/elements/Document;->getNodeDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeDescriptor;

    move-result-object v0

    .line 146
    .local v0, "nodeDescriptor":Lcom/facebook/stetho/inspector/elements/NodeDescriptor;
    invoke-interface {v0, p1, p2}, Lcom/facebook/stetho/inspector/elements/NodeDescriptor;->getStyles(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    .line 147
    return-void
.end method

.method public getNodeDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeDescriptor;
    .registers 3
    .param p1, "element"    # Ljava/lang/Object;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 107
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document;->verifyThreadAccess()V

    .line 108
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v0, p1}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->getNodeDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeDescriptor;

    move-result-object v0

    return-object v0
.end method

.method public getNodeIdForElement(Ljava/lang/Object;)Ljava/lang/Integer;
    .registers 3
    .param p1, "element"    # Ljava/lang/Object;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 129
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mObjectIdMapper:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->getIdForObject(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getRootElement()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 155
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document;->verifyThreadAccess()V

    .line 157
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v1}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->getRootElement()Ljava/lang/Object;

    move-result-object v0

    .line 158
    .local v0, "rootElement":Ljava/lang/Object;
    if-nez v0, :cond_11

    .line 161
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 164
    :cond_11
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mShadowDocument:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-virtual {v1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->getRootElement()Ljava/lang/Object;

    move-result-object v1

    if-eq v0, v1, :cond_1f

    .line 168
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 171
    :cond_1f
    return-object v0
.end method

.method public hideHighlight()V
    .registers 2

    .prologue
    .line 117
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document;->verifyThreadAccess()V

    .line 118
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v0}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->hideHighlight()V

    .line 119
    return-void
.end method

.method public highlightElement(Ljava/lang/Object;I)V
    .registers 4
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "color"    # I

    .prologue
    .line 112
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document;->verifyThreadAccess()V

    .line 113
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v0, p1, p2}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->highlightElement(Ljava/lang/Object;I)V

    .line 114
    return-void
.end method

.method public declared-synchronized release()V
    .registers 2

    .prologue
    .line 62
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mReferenceCounter:I

    if-lez v0, :cond_10

    .line 63
    iget v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mReferenceCounter:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mReferenceCounter:I

    if-nez v0, :cond_10

    .line 64
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/Document;->cleanUp()V
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_12

    .line 67
    :cond_10
    monitor-exit p0

    return-void

    .line 62
    :catchall_12
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public removeUpdateListener(Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;)V
    .registers 3
    .param p1, "updateListener"    # Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;

    .prologue
    .line 103
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mUpdateListeners:Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->remove(Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;)V

    .line 104
    return-void
.end method

.method public setAttributesAsText(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 4
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "text"    # Ljava/lang/String;

    .prologue
    .line 139
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document;->verifyThreadAccess()V

    .line 140
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v0, p1, p2}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->setAttributesAsText(Ljava/lang/Object;Ljava/lang/String;)V

    .line 141
    return-void
.end method

.method public setInspectModeEnabled(Z)V
    .registers 3
    .param p1, "enabled"    # Z

    .prologue
    .line 122
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document;->verifyThreadAccess()V

    .line 123
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v0, p1}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->setInspectModeEnabled(Z)V

    .line 124
    return-void
.end method
