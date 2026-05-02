.class Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$8;
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
    .line 274
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$8;->this$0:Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    iput-object p2, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$8;->val$library:Lcom/mikepenz/aboutlibraries/entity/Library;

    iput-object p3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$8;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 277
    const/4 v0, 0x0

    .line 278
    .local v0, "consumed":Z
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v1

    if-eqz v1, :cond_19

    .line 279
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$8;->val$library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-interface {v1, p1, v2}, Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;->onLibraryContentClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/entity/Library;)Z

    move-result v0

    .line 282
    :cond_19
    if-nez v0, :cond_30

    .line 283
    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$8;->this$0:Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$8;->val$ctx:Landroid/content/Context;

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$8;->val$library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryWebsite()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_31

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$8;->val$library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryWebsite()Ljava/lang/String;

    move-result-object v1

    :goto_2d
    # invokes: Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->openLibraryWebsite(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {v2, v3, v1}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->access$200(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;Landroid/content/Context;Ljava/lang/String;)V

    .line 285
    :cond_30
    return-void

    .line 283
    :cond_31
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$8;->val$library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getRepositoryLink()Ljava/lang/String;

    move-result-object v1

    goto :goto_2d
.end method
