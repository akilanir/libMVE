.class Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$2;
.super Ljava/lang/Object;
.source "DatePickerDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;


# direct methods
.method constructor <init>(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;)V
    .registers 2

    .prologue
    .line 302
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$2;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 305
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$2;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->tryVibrate()V

    .line 306
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$2;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$2;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->cancel()V

    .line 307
    :cond_16
    return-void
.end method
