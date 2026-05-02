.class Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$1;
.super Ljava/lang/Object;
.source "RadialPickerLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;


# direct methods
.method constructor <init>(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)V
    .registers 2

    .prologue
    .line 614
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$1;->this$0:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 617
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$1;->this$0:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    # getter for: Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;
    invoke-static {v0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->access$100(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    move-result-object v0

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$1;->this$0:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    # getter for: Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I
    invoke-static {v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->access$000(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->setAmOrPmPressed(I)V

    .line 618
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$1;->this$0:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    # getter for: Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;
    invoke-static {v0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->access$100(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->invalidate()V

    .line 619
    return-void
.end method
