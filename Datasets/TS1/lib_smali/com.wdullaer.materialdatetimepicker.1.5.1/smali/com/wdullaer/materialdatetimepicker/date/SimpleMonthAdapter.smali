.class public Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthAdapter;
.super Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;
.source "SimpleMonthAdapter.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "controller"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    .prologue
    .line 27
    invoke-direct {p0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;-><init>(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;)V

    .line 28
    return-void
.end method


# virtual methods
.method public createMonthView(Landroid/content/Context;)Lcom/wdullaer/materialdatetimepicker/date/MonthView;
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 32
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthAdapter;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-direct {v0, p1, v1, v2}, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;)V

    .line 33
    .local v0, "monthView":Lcom/wdullaer/materialdatetimepicker/date/MonthView;
    return-object v0
.end method
