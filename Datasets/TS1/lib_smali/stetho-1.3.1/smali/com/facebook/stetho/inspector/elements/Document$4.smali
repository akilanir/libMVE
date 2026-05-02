.class Lcom/facebook/stetho/inspector/elements/Document$4;
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
.field final synthetic this$0:Lcom/facebook/stetho/inspector/elements/Document;

.field final synthetic val$docUpdate:Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;


# direct methods
.method constructor <init>(Lcom/facebook/stetho/inspector/elements/Document;Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;)V
    .registers 3
    .param p1, "this$0"    # Lcom/facebook/stetho/inspector/elements/Document;

    .prologue
    .line 372
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Document$4;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    iput-object p2, p0, Lcom/facebook/stetho/inspector/elements/Document$4;->val$docUpdate:Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public store(Ljava/lang/Object;)V
    .registers 8
    .param p1, "element"    # Ljava/lang/Object;

    .prologue
    .line 376
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/Document$4;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    # getter for: Lcom/facebook/stetho/inspector/elements/Document;->mObjectIdMapper:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;
    invoke-static {v4}, Lcom/facebook/stetho/inspector/elements/Document;->access$500(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->containsObject(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_d

    .line 392
    :cond_c
    :goto_c
    return-void

    .line 380
    :cond_d
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/Document$4;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    # getter for: Lcom/facebook/stetho/inspector/elements/Document;->mShadowDocument:Lcom/facebook/stetho/inspector/elements/ShadowDocument;
    invoke-static {v4}, Lcom/facebook/stetho/inspector/elements/Document;->access$100(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->getElementInfo(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/ElementInfo;

    move-result-object v2

    .line 381
    .local v2, "oldElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    if-eqz v2, :cond_c

    .line 385
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/Document$4;->val$docUpdate:Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;

    invoke-virtual {v4, p1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->getElementInfo(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/ElementInfo;

    move-result-object v0

    .line 387
    .local v0, "newElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    iget-object v4, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    iget-object v5, v2, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-eq v4, v5, :cond_c

    .line 388
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/Document$4;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    # getter for: Lcom/facebook/stetho/inspector/elements/Document;->mObjectIdMapper:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;
    invoke-static {v4}, Lcom/facebook/stetho/inspector/elements/Document;->access$500(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    move-result-object v4

    iget-object v5, v2, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    invoke-virtual {v4, v5}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->getIdForObject(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 389
    .local v3, "parentNodeId":I
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/Document$4;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    # getter for: Lcom/facebook/stetho/inspector/elements/Document;->mObjectIdMapper:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;
    invoke-static {v4}, Lcom/facebook/stetho/inspector/elements/Document;->access$500(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->getIdForObject(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 390
    .local v1, "nodeId":I
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/Document$4;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    # getter for: Lcom/facebook/stetho/inspector/elements/Document;->mUpdateListeners:Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;
    invoke-static {v4}, Lcom/facebook/stetho/inspector/elements/Document;->access$700(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;

    move-result-object v4

    invoke-virtual {v4, v3, v1}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->onChildNodeRemoved(II)V

    goto :goto_c
.end method
