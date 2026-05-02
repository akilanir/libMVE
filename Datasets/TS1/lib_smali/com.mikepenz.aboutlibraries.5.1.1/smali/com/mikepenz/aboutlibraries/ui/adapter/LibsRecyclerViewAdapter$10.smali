.class Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$10;
.super Ljava/lang/Object;
.source "LibsRecyclerViewAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 310
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$10;->this$0:Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    iput-object p2, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$10;->val$library:Lcom/mikepenz/aboutlibraries/entity/Library;

    iput-object p3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$10;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 7
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 313
    const/4 v0, 0x0

    .line 314
    .local v0, "consumed":Z
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v1

    if-eqz v1, :cond_19

    .line 315
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$10;->val$library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-interface {v1, p1, v2}, Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;->onLibraryBottomClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/entity/Library;)Z

    move-result v0

    .line 318
    :cond_19
    if-nez v0, :cond_2a

    .line 319
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$10;->this$0:Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$10;->val$ctx:Landroid/content/Context;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$10;->this$0:Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    # getter for: Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v3}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->access$000(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$10;->val$library:Lcom/mikepenz/aboutlibraries/entity/Library;

    # invokes: Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->openLicense(Landroid/content/Context;Lcom/mikepenz/aboutlibraries/LibsBuilder;Lcom/mikepenz/aboutlibraries/entity/Library;)V
    invoke-static {v1, v2, v3, v4}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->access$300(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;Landroid/content/Context;Lcom/mikepenz/aboutlibraries/LibsBuilder;Lcom/mikepenz/aboutlibraries/entity/Library;)V

    .line 321
    :cond_2a
    return-void
.end method
