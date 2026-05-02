.class Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$3;
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
    .line 153
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$3;->this$0:Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;

    iput-object p2, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$3;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 156
    const/4 v0, 0x0

    .line 157
    .local v0, "consumed":Z
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v1

    if-eqz v1, :cond_1b

    .line 158
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$3;->this$0:Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-interface {v1, p1, v2}, Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;->onLibraryContentClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/entity/Library;)Z

    move-result v0

    .line 161
    :cond_1b
    if-nez v0, :cond_36

    .line 162
    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$3;->this$0:Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$3;->val$ctx:Landroid/content/Context;

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$3;->this$0:Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryWebsite()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_37

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$3;->this$0:Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryWebsite()Ljava/lang/String;

    move-result-object v1

    :goto_33
    # invokes: Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->openLibraryWebsite(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {v2, v3, v1}, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->access$100(Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;Landroid/content/Context;Ljava/lang/String;)V

    .line 164
    :cond_36
    return-void

    .line 162
    :cond_37
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$3;->this$0:Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getRepositoryLink()Ljava/lang/String;

    move-result-object v1

    goto :goto_33
.end method
