.class Lcom/facebook/stetho/inspector/elements/Document$5;
.super Ljava/lang/Object;
.source "Document.java"

# interfaces
.implements Lcom/facebook/stetho/common/Accumulator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/stetho/inspector/elements/Document;->applyDocumentUpdate(Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/stetho/common/Accumulator",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field private insertedElements:Lcom/facebook/stetho/common/Accumulator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/stetho/common/Accumulator",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final listenerInsertedElements:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/facebook/stetho/inspector/elements/Document;

.field final synthetic val$docUpdate:Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;


# direct methods
.method constructor <init>(Lcom/facebook/stetho/inspector/elements/Document;Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;)V
    .registers 4
    .param p1, "this$0"    # Lcom/facebook/stetho/inspector/elements/Document;

    .prologue
    .line 397
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Document$5;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    iput-object p2, p0, Lcom/facebook/stetho/inspector/elements/Document$5;->val$docUpdate:Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 398
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document$5;->listenerInsertedElements:Ljava/util/HashSet;

    .line 400
    new-instance v0, Lcom/facebook/stetho/inspector/elements/Document$5$1;

    invoke-direct {v0, p0}, Lcom/facebook/stetho/inspector/elements/Document$5$1;-><init>(Lcom/facebook/stetho/inspector/elements/Document$5;)V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document$5;->insertedElements:Lcom/facebook/stetho/common/Accumulator;

    return-void
.end method

.method static synthetic access$800(Lcom/facebook/stetho/inspector/elements/Document$5;)Ljava/util/HashSet;
    .registers 2
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document$5;

    .prologue
    .line 397
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document$5;->listenerInsertedElements:Ljava/util/HashSet;

    return-object v0
.end method


# virtual methods
.method public store(Ljava/lang/Object;)V
    .registers 13
    .param p1, "element"    # Ljava/lang/Object;

    .prologue
    .line 415
    iget-object v9, p0, Lcom/facebook/stetho/inspector/elements/Document$5;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    # getter for: Lcom/facebook/stetho/inspector/elements/Document;->mObjectIdMapper:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;
    invoke-static {v9}, Lcom/facebook/stetho/inspector/elements/Document;->access$500(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    move-result-object v9

    invoke-virtual {v9, p1}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->containsObject(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_d

    .line 453
    :cond_c
    :goto_c
    return-void

    .line 419
    :cond_d
    iget-object v9, p0, Lcom/facebook/stetho/inspector/elements/Document$5;->listenerInsertedElements:Ljava/util/HashSet;

    invoke-virtual {v9, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_c

    .line 426
    iget-object v9, p0, Lcom/facebook/stetho/inspector/elements/Document$5;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    # getter for: Lcom/facebook/stetho/inspector/elements/Document;->mShadowDocument:Lcom/facebook/stetho/inspector/elements/ShadowDocument;
    invoke-static {v9}, Lcom/facebook/stetho/inspector/elements/Document;->access$100(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    move-result-object v9

    invoke-virtual {v9, p1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->getElementInfo(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/ElementInfo;

    move-result-object v8

    .line 427
    .local v8, "oldElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    iget-object v9, p0, Lcom/facebook/stetho/inspector/elements/Document$5;->val$docUpdate:Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;

    invoke-virtual {v9, p1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->getElementInfo(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/ElementInfo;

    move-result-object v6

    .line 429
    .local v6, "newElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    if-eqz v8, :cond_59

    iget-object v7, v8, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    .line 433
    .local v7, "oldChildren":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :goto_29
    iget-object v5, v6, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    .line 437
    .local v5, "newChildren":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    iget-object v9, p0, Lcom/facebook/stetho/inspector/elements/Document$5;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    iget-object v10, p0, Lcom/facebook/stetho/inspector/elements/Document$5;->val$docUpdate:Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;

    # invokes: Lcom/facebook/stetho/inspector/elements/Document;->acquireChildEventingList(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/DocumentView;)Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;
    invoke-static {v9, p1, v10}, Lcom/facebook/stetho/inspector/elements/Document;->access$900(Lcom/facebook/stetho/inspector/elements/Document;Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/DocumentView;)Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;

    move-result-object v3

    .line 438
    .local v3, "listenerChildren":Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v0

    .local v0, "N":I
    :goto_38
    if-ge v2, v0, :cond_62

    .line 439
    invoke-interface {v7, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 440
    .local v1, "childElement":Ljava/lang/Object;
    iget-object v9, p0, Lcom/facebook/stetho/inspector/elements/Document$5;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    # getter for: Lcom/facebook/stetho/inspector/elements/Document;->mObjectIdMapper:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;
    invoke-static {v9}, Lcom/facebook/stetho/inspector/elements/Document;->access$500(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    move-result-object v9

    invoke-virtual {v9, v1}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->containsObject(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_56

    .line 441
    iget-object v9, p0, Lcom/facebook/stetho/inspector/elements/Document$5;->val$docUpdate:Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;

    invoke-virtual {v9, v1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->getElementInfo(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/ElementInfo;

    move-result-object v4

    .line 442
    .local v4, "newChildElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    if-eqz v4, :cond_5e

    iget-object v9, v4, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-eq v9, p1, :cond_5e

    .line 438
    .end local v4    # "newChildElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    :cond_56
    :goto_56
    add-int/lit8 v2, v2, 0x1

    goto :goto_38

    .line 431
    .end local v0    # "N":I
    .end local v1    # "childElement":Ljava/lang/Object;
    .end local v2    # "i":I
    .end local v3    # "listenerChildren":Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;
    .end local v5    # "newChildren":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .end local v7    # "oldChildren":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :cond_59
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v7

    goto :goto_29

    .line 446
    .restart local v0    # "N":I
    .restart local v1    # "childElement":Ljava/lang/Object;
    .restart local v2    # "i":I
    .restart local v3    # "listenerChildren":Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;
    .restart local v4    # "newChildElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    .restart local v5    # "newChildren":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .restart local v7    # "oldChildren":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :cond_5e
    invoke-virtual {v3, v1}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->add(Ljava/lang/Object;)Z

    goto :goto_56

    .line 451
    .end local v1    # "childElement":Ljava/lang/Object;
    .end local v4    # "newChildElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    :cond_62
    iget-object v9, p0, Lcom/facebook/stetho/inspector/elements/Document$5;->insertedElements:Lcom/facebook/stetho/common/Accumulator;

    # invokes: Lcom/facebook/stetho/inspector/elements/Document;->updateListenerChildren(Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;Ljava/util/List;Lcom/facebook/stetho/common/Accumulator;)V
    invoke-static {v3, v5, v9}, Lcom/facebook/stetho/inspector/elements/Document;->access$1000(Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;Ljava/util/List;Lcom/facebook/stetho/common/Accumulator;)V

    .line 452
    iget-object v9, p0, Lcom/facebook/stetho/inspector/elements/Document$5;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    # invokes: Lcom/facebook/stetho/inspector/elements/Document;->releaseChildEventingList(Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;)V
    invoke-static {v9, v3}, Lcom/facebook/stetho/inspector/elements/Document;->access$1100(Lcom/facebook/stetho/inspector/elements/Document;Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;)V

    goto :goto_c
.end method
