.class Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$1;
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


# direct methods
.method constructor <init>(Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;)V
    .registers 2
    .param p1, "this$0"    # Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;

    .prologue
    .line 100
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$1;->this$0:Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 103
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 104
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;->onIconClicked(Landroid/view/View;)V

    .line 106
    :cond_15
    return-void
.end method
