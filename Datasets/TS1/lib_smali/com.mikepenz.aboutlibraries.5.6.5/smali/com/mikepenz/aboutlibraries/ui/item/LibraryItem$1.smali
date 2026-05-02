.class Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$1;
.super Ljava/lang/Object;
.source "LibraryItem.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->bindView(Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;

.field final synthetic val$ctx:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;Landroid/content/Context;)V
    .registers 3
    .param p1, "this$0"    # Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;

    .prologue
    .line 117
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$1;->this$0:Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;

    iput-object p2, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$1;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 6
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 120
    const/4 v0, 0x0

    .line 121
    .local v0, "consumed":Z
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v1

    if-eqz v1, :cond_1b

    .line 122
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$1;->this$0:Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-interface {v1, p1, v2}, Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;->onLibraryAuthorClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/entity/Library;)Z

    move-result v0

    .line 125
    :cond_1b
    if-nez v0, :cond_2c

    .line 126
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$1;->this$0:Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$1;->val$ctx:Landroid/content/Context;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$1;->this$0:Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v3}, Lcom/mikepenz/aboutlibraries/entity/Library;->getAuthorWebsite()Ljava/lang/String;

    move-result-object v3

    # invokes: Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->openAuthorWebsite(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {v1, v2, v3}, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->access$000(Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;Landroid/content/Context;Ljava/lang/String;)V

    .line 128
    :cond_2c
    return-void
.end method
