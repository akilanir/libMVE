.class Lcom/mikepenz/materialdrawer/view/BezelImageView$CustomOutline;
.super Landroid/view/ViewOutlineProvider;
.source "BezelImageView.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/materialdrawer/view/BezelImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CustomOutline"
.end annotation


# instance fields
.field height:I

.field final synthetic this$0:Lcom/mikepenz/materialdrawer/view/BezelImageView;

.field width:I


# direct methods
.method constructor <init>(Lcom/mikepenz/materialdrawer/view/BezelImageView;II)V
    .registers 4
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 144
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView$CustomOutline;->this$0:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 145
    iput p2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView$CustomOutline;->width:I

    .line 146
    iput p3, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView$CustomOutline;->height:I

    .line 147
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .registers 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "outline"    # Landroid/graphics/Outline;

    .prologue
    const/4 v2, 0x0

    .line 151
    iget v0, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView$CustomOutline;->width:I

    iget v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView$CustomOutline;->height:I

    invoke-virtual {p2, v2, v2, v0, v1}, Landroid/graphics/Outline;->setOval(IIII)V

    .line 152
    return-void
.end method
