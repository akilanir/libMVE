.class Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$3;
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


# direct methods
.method constructor <init>(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;Landroid/content/Context;)V
    .registers 3
    .param p1, "this$0"    # Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    .prologue
    .line 107
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$3;->this$0:Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    iput-object p2, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$3;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 110
    const/4 v1, 0x0

    .line 111
    .local v1, "consumed":Z
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v2

    if-eqz v2, :cond_19

    .line 112
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v2

    sget-object v3, Lcom/mikepenz/aboutlibraries/Libs$SpecialButton;->SPECIAL1:Lcom/mikepenz/aboutlibraries/Libs$SpecialButton;

    invoke-interface {v2, p1, v3}, Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;->onExtraClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/Libs$SpecialButton;)Z

    move-result v1

    .line 115
    :cond_19
    if-nez v1, :cond_38

    .line 117
    :try_start_1b
    new-instance v0, Landroid/support/v7/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$3;->val$ctx:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 118
    .local v0, "alert":Landroid/support/v7/app/AlertDialog$Builder;
    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$3;->this$0:Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    # getter for: Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v2}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->access$000(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v2

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1Description:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 119
    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v7/app/AlertDialog;->show()V
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_38} :catch_39

    .line 123
    .end local v0    # "alert":Landroid/support/v7/app/AlertDialog$Builder;
    :cond_38
    :goto_38
    return-void

    .line 120
    :catch_39
    move-exception v2

    goto :goto_38
.end method
