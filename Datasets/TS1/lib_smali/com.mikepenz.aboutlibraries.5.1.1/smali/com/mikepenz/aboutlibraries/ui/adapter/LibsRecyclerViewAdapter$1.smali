.class Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$1;
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


# direct methods
.method constructor <init>(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;)V
    .registers 2
    .param p1, "this$0"    # Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$1;->this$0:Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 73
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 74
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;->onIconClicked(Landroid/view/View;)V

    .line 76
    :cond_15
    return-void
.end method
