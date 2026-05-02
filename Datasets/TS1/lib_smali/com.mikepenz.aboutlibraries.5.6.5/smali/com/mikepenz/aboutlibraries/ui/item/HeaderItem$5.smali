.class Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$5;
.super Ljava/lang/Object;
.source "HeaderItem.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->bindView(Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;

.field final synthetic val$ctx:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;Landroid/content/Context;)V
    .registers 3
    .param p1, "this$0"    # Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;

    .prologue
    .line 186
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$5;->this$0:Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;

    iput-object p2, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$5;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 189
    const/4 v1, 0x0

    .line 190
    .local v1, "consumed":Z
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v2

    if-eqz v2, :cond_19

    .line 191
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v2

    sget-object v3, Lcom/mikepenz/aboutlibraries/Libs$SpecialButton;->SPECIAL3:Lcom/mikepenz/aboutlibraries/Libs$SpecialButton;

    invoke-interface {v2, p1, v3}, Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;->onExtraClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/Libs$SpecialButton;)Z

    move-result v1

    .line 194
    :cond_19
    if-nez v1, :cond_42

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$5;->this$0:Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3Description:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_42

    .line 196
    :try_start_27
    new-instance v0, Landroid/support/v7/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$5;->val$ctx:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 197
    .local v0, "alert":Landroid/support/v7/app/AlertDialog$Builder;
    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$5;->this$0:Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3Description:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 198
    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v7/app/AlertDialog;->show()V
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_42} :catch_43

    .line 202
    .end local v0    # "alert":Landroid/support/v7/app/AlertDialog$Builder;
    :cond_42
    :goto_42
    return-void

    .line 199
    :catch_43
    move-exception v2

    goto :goto_42
.end method
