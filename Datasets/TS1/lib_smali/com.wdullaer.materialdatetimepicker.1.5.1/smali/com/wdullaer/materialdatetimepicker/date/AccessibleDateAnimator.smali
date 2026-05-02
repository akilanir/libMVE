.class public Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;
.super Landroid/widget/ViewAnimator;
.source "AccessibleDateAnimator.java"


# instance fields
.field private mDateMillis:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Landroid/widget/ViewAnimator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    return-void
.end method


# virtual methods
.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 7
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 41
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v2

    const/16 v3, 0x20

    if-ne v2, v3, :cond_24

    .line 43
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 44
    const/16 v1, 0x16

    .line 47
    .local v1, "flags":I
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-wide v3, p0, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->mDateMillis:J

    invoke-static {v2, v3, v4, v1}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    move-result-object v0

    .line 48
    .local v0, "dateString":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    const/4 v2, 0x1

    .line 51
    .end local v0    # "dateString":Ljava/lang/String;
    .end local v1    # "flags":I
    :goto_23
    return v2

    :cond_24
    invoke-super {p0, p1}, Landroid/widget/ViewAnimator;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v2

    goto :goto_23
.end method

.method public setDateMillis(J)V
    .registers 3
    .param p1, "dateMillis"    # J

    .prologue
    .line 33
    iput-wide p1, p0, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->mDateMillis:J

    .line 34
    return-void
.end method
