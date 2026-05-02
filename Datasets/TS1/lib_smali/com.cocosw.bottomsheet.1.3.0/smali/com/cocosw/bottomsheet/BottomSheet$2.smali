.class Lcom/cocosw/bottomsheet/BottomSheet$2;
.super Ljava/lang/Object;
.source "BottomSheet.java"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cocosw/bottomsheet/BottomSheet;->init(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cocosw/bottomsheet/BottomSheet;


# direct methods
.method constructor <init>(Lcom/cocosw/bottomsheet/BottomSheet;)V
    .registers 2

    .prologue
    .line 175
    iput-object p1, p0, Lcom/cocosw/bottomsheet/BottomSheet$2;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onShow(Landroid/content/DialogInterface;)V
    .registers 4
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;

    .prologue
    .line 178
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$2;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->showListener:Landroid/content/DialogInterface$OnShowListener;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$100(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/content/DialogInterface$OnShowListener;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 179
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$2;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->showListener:Landroid/content/DialogInterface$OnShowListener;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$100(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/content/DialogInterface$OnShowListener;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnShowListener;->onShow(Landroid/content/DialogInterface;)V

    .line 180
    :cond_11
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$2;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->list:Landroid/widget/GridView;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$300(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/widget/GridView;

    move-result-object v0

    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet$2;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->adapter:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;
    invoke-static {v1}, Lcom/cocosw/bottomsheet/BottomSheet;->access$200(Lcom/cocosw/bottomsheet/BottomSheet;)Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 181
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$2;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->list:Landroid/widget/GridView;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$300(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/widget/GridView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/GridView;->startLayoutAnimation()V

    .line 182
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$2;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$400(Lcom/cocosw/bottomsheet/BottomSheet;)Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    move-result-object v0

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->icon:Landroid/graphics/drawable/Drawable;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$500(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_41

    .line 183
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$2;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->icon:Landroid/widget/ImageView;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$600(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/widget/ImageView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 188
    :goto_40
    return-void

    .line 185
    :cond_41
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$2;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->icon:Landroid/widget/ImageView;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$600(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/widget/ImageView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 186
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$2;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->icon:Landroid/widget/ImageView;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$600(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/widget/ImageView;

    move-result-object v0

    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet$2;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    invoke-static {v1}, Lcom/cocosw/bottomsheet/BottomSheet;->access$400(Lcom/cocosw/bottomsheet/BottomSheet;)Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    move-result-object v1

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->icon:Landroid/graphics/drawable/Drawable;
    invoke-static {v1}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$500(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_40
.end method
