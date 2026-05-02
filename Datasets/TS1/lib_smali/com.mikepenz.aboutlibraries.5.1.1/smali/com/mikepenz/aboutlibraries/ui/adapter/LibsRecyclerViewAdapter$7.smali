.class Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$7;
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
    .line 251
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$7;->this$0:Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    iput-object p2, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$7;->val$library:Lcom/mikepenz/aboutlibraries/entity/Library;

    iput-object p3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$7;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .registers 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 254
    const/4 v0, 0x0

    .line 255
    .local v0, "consumed":Z
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v1

    if-eqz v1, :cond_19

    .line 256
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$7;->val$library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-interface {v1, p1, v2}, Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;->onLibraryAuthorLongClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/entity/Library;)Z

    move-result v0

    .line 259
    :cond_19
    if-nez v0, :cond_29

    .line 260
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$7;->this$0:Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$7;->val$ctx:Landroid/content/Context;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$7;->val$library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v3}, Lcom/mikepenz/aboutlibraries/entity/Library;->getAuthorWebsite()Ljava/lang/String;

    move-result-object v3

    # invokes: Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->openAuthorWebsite(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {v1, v2, v3}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->access$100(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;Landroid/content/Context;Ljava/lang/String;)V

    .line 261
    const/4 v0, 0x1

    .line 263
    :cond_29
    return v0
.end method
