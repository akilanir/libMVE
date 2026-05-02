.class Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$5;
.super Ljava/lang/Object;
.source "TimePickerDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;


# direct methods
.method constructor <init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)V
    .registers 2

    .prologue
    .line 297
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$5;->this$0:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 300
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$5;->this$0:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->tryVibrate()V

    .line 301
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$5;->this$0:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    # getter for: Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;
    invoke-static {v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->access$600(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    move-result-object v1

    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getIsCurrentlyAmOrPm()I

    move-result v0

    .line 302
    .local v0, "amOrPm":I
    if-nez v0, :cond_21

    .line 303
    const/4 v0, 0x1

    .line 307
    :cond_12
    :goto_12
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$5;->this$0:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    # invokes: Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->updateAmPmDisplay(I)V
    invoke-static {v1, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->access$700(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;I)V

    .line 308
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$5;->this$0:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    # getter for: Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;
    invoke-static {v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->access$600(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setAmOrPm(I)V

    .line 309
    return-void

    .line 304
    :cond_21
    const/4 v1, 0x1

    if-ne v0, v1, :cond_12

    .line 305
    const/4 v0, 0x0

    goto :goto_12
.end method
