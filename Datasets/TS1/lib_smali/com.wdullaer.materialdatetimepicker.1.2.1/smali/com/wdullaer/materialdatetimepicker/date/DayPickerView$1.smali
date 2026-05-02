.class Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$1;
.super Ljava/lang/Object;
.source "DayPickerView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->postSetSelection(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;I)V
    .registers 3

    .prologue
    .line 238
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$1;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$1;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 242
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$1;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$1;->val$position:I

    invoke-virtual {v0, v1}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->setSelection(I)V

    .line 243
    return-void
.end method
