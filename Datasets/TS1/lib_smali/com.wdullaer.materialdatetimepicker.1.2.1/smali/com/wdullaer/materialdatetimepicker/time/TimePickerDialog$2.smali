.class Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$2;
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
    .line 246
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$2;->this$0:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x1

    .line 249
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$2;->this$0:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    const/4 v1, 0x0

    # invokes: Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->setCurrentItemShowing(IZZZ)V
    invoke-static {v0, v2, v2, v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->access$100(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;IZZZ)V

    .line 250
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$2;->this$0:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->tryVibrate()V

    .line 251
    return-void
.end method
