.class Lcom/rey/material/widget/DatePicker$MonthView$1;
.super Ljava/lang/Object;
.source "DatePicker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/DatePicker$MonthView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/rey/material/widget/DatePicker$MonthView;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/DatePicker$MonthView;)V
    .registers 2

    .prologue
    .line 761
    iput-object p1, p0, Lcom/rey/material/widget/DatePicker$MonthView$1;->this$1:Lcom/rey/material/widget/DatePicker$MonthView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 765
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker$MonthView$1;->this$1:Lcom/rey/material/widget/DatePicker$MonthView;

    # invokes: Lcom/rey/material/widget/DatePicker$MonthView;->update()V
    invoke-static {v0}, Lcom/rey/material/widget/DatePicker$MonthView;->access$2400(Lcom/rey/material/widget/DatePicker$MonthView;)V

    .line 766
    return-void
.end method
