.class Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
.super Ljava/lang/Object;
.source "TimePickerDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
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


# direct methods
.method public varargs constructor <init>([I)V
    .registers 3
    .param p1, "legalKeys"    # [I

    .prologue
    .line 1042
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1043
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->mLegalKeys:[I

    .line 1044
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->mChildren:Ljava/util/ArrayList;

    .line 1045
    return-void
.end method


# virtual methods
.method public addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V
    .registers 3
    .param p1, "child"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .prologue
    .line 1048
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1049
    return-void
.end method

.method public canReach(I)Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    .registers 6
    .param p1, "key"    # I

    .prologue
    const/4 v2, 0x0

    .line 1061
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->mChildren:Ljava/util/ArrayList;

    if-nez v3, :cond_7

    move-object v0, v2

    .line 1069
    :goto_6
    return-object v0

    .line 1064
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

    .line 1065
    .local v0, "child":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    invoke-virtual {v0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->containsKey(I)Z

    move-result v3

    if-eqz v3, :cond_d

    goto :goto_6

    .end local v0    # "child":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    :cond_20
    move-object v0, v2

    .line 1069
    goto :goto_6
.end method

.method public containsKey(I)Z
    .registers 4
    .param p1, "key"    # I

    .prologue
    .line 1052
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->mLegalKeys:[I

    array-length v1, v1

    if-ge v0, v1, :cond_11

    .line 1053
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->mLegalKeys:[I

    aget v1, v1, v0

    if-ne v1, p1, :cond_e

    .line 1054
    const/4 v1, 0x1

    .line 1057
    :goto_d
    return v1

    .line 1052
    :cond_e
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1057
    :cond_11
    const/4 v1, 0x0

    goto :goto_d
.end method
