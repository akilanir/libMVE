.class Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$4;
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
    .line 330
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$4;->this$0:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 333
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$4;->this$0:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->tryVibrate()V

    .line 334
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$4;->this$0:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$4;->this$0:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->cancel()V

    .line 335
    :cond_16
    return-void
.end method
