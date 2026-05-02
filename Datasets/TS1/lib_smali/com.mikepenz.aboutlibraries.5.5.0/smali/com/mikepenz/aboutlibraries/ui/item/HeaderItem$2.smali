.class Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$2;
.super Ljava/lang/Object;
.source "HeaderItem.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


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


# direct methods
.method constructor <init>(Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;)V
    .registers 2
    .param p1, "this$0"    # Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;

    .prologue
    .line 109
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$2;->this$0:Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 112
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v0

    if-eqz v0, :cond_1a

    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;->onIconLongClicked(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_1a

    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method
