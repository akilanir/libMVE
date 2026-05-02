.class Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$11;
.super Ljava/lang/Object;
.source "LibsRecyclerViewAdapter.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

.field final synthetic val$ctx:Landroid/content/Context;

.field final synthetic val$library:Lcom/mikepenz/aboutlibraries/entity/Library;


# direct methods
.method constructor <init>(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;Lcom/mikepenz/aboutlibraries/entity/Library;Landroid/content/Context;)V
    .registers 4
    .param p1, "this$0"    # Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    .prologue
    .line 323
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$11;->this$0:Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    iput-object p2, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$11;->val$library:Lcom/mikepenz/aboutlibraries/entity/Library;

    iput-object p3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$11;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .registers 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 326
    const/4 v0, 0x0

    .line 327
    .local v0, "consumed":Z
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v1

    if-eqz v1, :cond_19

    .line 328
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$11;->val$library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-interface {v1, p1, v2}, Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;->onLibraryBottomLongClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/entity/Library;)Z

    move-result v0

    .line 331
    :cond_19
    if-nez v0, :cond_2b

    .line 332
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$11;->this$0:Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$11;->val$ctx:Landroid/content/Context;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$11;->this$0:Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    # getter for: Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v3}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->access$000(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$11;->val$library:Lcom/mikepenz/aboutlibraries/entity/Library;

    # invokes: Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->openLicense(Landroid/content/Context;Lcom/mikepenz/aboutlibraries/LibsBuilder;Lcom/mikepenz/aboutlibraries/entity/Library;)V
    invoke-static {v1, v2, v3, v4}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->access$300(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;Landroid/content/Context;Lcom/mikepenz/aboutlibraries/LibsBuilder;Lcom/mikepenz/aboutlibraries/entity/Library;)V

    .line 333
    const/4 v0, 0x1

    .line 335
    :cond_2b
    return v0
.end method
