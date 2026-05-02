.class Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
.super Ljava/lang/Object;
.source "TimePickerDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Node"
.end annotation


# instance fields
.field private mChildren:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;",
            ">;"
        }
    .end annotation
.end field

.field private mLegalKeys:[I

.field final synthetic this$0:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;


# direct methods
.method public varargs constructor <init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V
    .registers 4
    .param p2, "legalKeys"    # [I

    .prologue
    .line 962
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->this$0:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 963
    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->mLegalKeys:[I

    .line 964
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->mChildren:Ljava/util/ArrayList;

    .line 965
    return-void
.end method


# virtual methods
.method public addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V
    .registers 3
    .param p1, "child"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .prologue
    .line 968
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 969
    return-void
.end method

.method public canReach(I)Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    .registers 6
    .param p1, "key"    # I

    .prologue
    const/4 v2, 0x0

    .line 981
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->mChildren:Ljava/util/ArrayList;

    if-nez v3, :cond_7

    move-object v0, v2

    .line 989
    :goto_6
    return-object v0

    .line 984
    :cond_7
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_20

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .line 985
    .local v0, "child":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    invoke-virtual {v0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->containsKey(I)Z

    move-result v3

    if-eqz v3, :cond_d

    goto :goto_6

    .end local v0    # "child":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    :cond_20
    move-object v0, v2

    .line 989
    goto :goto_6
.end method

.method public containsKey(I)Z
    .registers 4
    .param p1, "key"    # I

    .prologue
    .line 972
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->mLegalKeys:[I

    array-length v1, v1

    if-ge v0, v1, :cond_11

    .line 973
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->mLegalKeys:[I

    aget v1, v1, v0

    if-ne v1, p1, :cond_e

    .line 974
    const/4 v1, 0x1

    .line 977
    :goto_d
    return v1

    .line 972
    :cond_e
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 977
    :cond_11
    const/4 v1, 0x0

    goto :goto_d
.end method
