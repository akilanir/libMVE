.class Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$1;
.super Ljava/lang/Object;
.source "YearPickerView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->postSetSelectionFromTop(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

.field final synthetic val$offset:I

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;II)V
    .registers 4

    .prologue
    .line 129
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$1;->this$0:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$1;->val$position:I

    iput p3, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$1;->val$offset:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 133
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$1;->this$0:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$1;->val$position:I

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$1;->val$offset:I

    invoke-virtual {v0, v1, v2}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->setSelectionFromTop(II)V

    .line 134
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$1;->this$0:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->requestLayout()V

    .line 135
    return-void
.end method
