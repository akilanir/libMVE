.class Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$2;
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

.field final synthetic val$isInnerCircle:[Ljava/lang/Boolean;


# direct methods
.method constructor <init>(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;[Ljava/lang/Boolean;)V
    .registers 3

    .prologue
    .line 631
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$2;->this$0:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$2;->val$isInnerCircle:[Ljava/lang/Boolean;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 634
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$2;->this$0:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    # setter for: Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDoingMove:Z
    invoke-static {v1, v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->access$202(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;Z)Z

    .line 635
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$2;->this$0:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$2;->this$0:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    # getter for: Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDownDegrees:I
    invoke-static {v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->access$300(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)I

    move-result v2

    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$2;->val$isInnerCircle:[Ljava/lang/Boolean;

    aget-object v3, v3, v4

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    # invokes: Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->reselectSelector(IZZZ)I
    invoke-static {v1, v2, v3, v4, v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->access$400(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;IZZZ)I

    move-result v0

    .line 637
    .local v0, "value":I
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$2;->this$0:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    # setter for: Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mLastValueSelected:I
    invoke-static {v1, v0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->access$502(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;I)I

    .line 638
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$2;->this$0:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    # getter for: Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mListener:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;
    invoke-static {v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->access$600(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;

    move-result-object v1

    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$2;->this$0:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v2

    invoke-interface {v1, v2, v0, v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;->onValueSelected(IIZ)V

    .line 639
    return-void
.end method
