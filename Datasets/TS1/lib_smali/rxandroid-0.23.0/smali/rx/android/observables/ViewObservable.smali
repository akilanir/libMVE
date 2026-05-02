.class public Lrx/android/observables/ViewObservable;
.super Ljava/lang/Object;
.source "ViewObservable.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clicks(Landroid/view/View;)Lrx/Observable;
    .registers 2
    .param p0, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Lrx/Observable",
            "<",
            "Lrx/android/events/OnClickEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 34
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lrx/android/observables/ViewObservable;->clicks(Landroid/view/View;Z)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static clicks(Landroid/view/View;Z)Lrx/Observable;
    .registers 3
    .param p0, "view"    # Landroid/view/View;
    .param p1, "emitInitialValue"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Z)",
            "Lrx/Observable",
            "<",
            "Lrx/android/events/OnClickEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 38
    new-instance v0, Lrx/android/operators/OperatorViewClick;

    invoke-direct {v0, p0, p1}, Lrx/android/operators/OperatorViewClick;-><init>(Landroid/view/View;Z)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static input(Landroid/widget/CompoundButton;)Lrx/Observable;
    .registers 2
    .param p0, "button"    # Landroid/widget/CompoundButton;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/CompoundButton;",
            ")",
            "Lrx/Observable",
            "<",
            "Lrx/android/events/OnCheckedChangeEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lrx/android/observables/ViewObservable;->input(Landroid/widget/CompoundButton;Z)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static input(Landroid/widget/CompoundButton;Z)Lrx/Observable;
    .registers 3
    .param p0, "button"    # Landroid/widget/CompoundButton;
    .param p1, "emitInitialValue"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/CompoundButton;",
            "Z)",
            "Lrx/Observable",
            "<",
            "Lrx/android/events/OnCheckedChangeEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 54
    new-instance v0, Lrx/android/operators/OperatorCompoundButtonInput;

    invoke-direct {v0, p0, p1}, Lrx/android/operators/OperatorCompoundButtonInput;-><init>(Landroid/widget/CompoundButton;Z)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static itemClicks(Landroid/widget/AdapterView;)Lrx/Observable;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)",
            "Lrx/Observable",
            "<",
            "Lrx/android/events/OnItemClickEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 58
    .local p0, "adapterView":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    new-instance v0, Lrx/android/operators/OperatorAdapterViewOnItemClick;

    invoke-direct {v0, p0}, Lrx/android/operators/OperatorAdapterViewOnItemClick;-><init>(Landroid/widget/AdapterView;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static text(Landroid/widget/TextView;)Lrx/Observable;
    .registers 2
    .param p0, "input"    # Landroid/widget/TextView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/TextView;",
            ")",
            "Lrx/Observable",
            "<",
            "Lrx/android/events/OnTextChangeEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 42
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lrx/android/observables/ViewObservable;->text(Landroid/widget/TextView;Z)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static text(Landroid/widget/TextView;Z)Lrx/Observable;
    .registers 3
    .param p0, "input"    # Landroid/widget/TextView;
    .param p1, "emitInitialValue"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/TextView;",
            "Z)",
            "Lrx/Observable",
            "<",
            "Lrx/android/events/OnTextChangeEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 46
    new-instance v0, Lrx/android/operators/OperatorTextViewInput;

    invoke-direct {v0, p0, p1}, Lrx/android/operators/OperatorTextViewInput;-><init>(Landroid/widget/TextView;Z)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method
