.class final Lcom/alibaba/fastjson/asm/Item;
.super Ljava/lang/Object;
.source "Item.java"


# instance fields
.field hashCode:I

.field index:I

.field intVal:I

.field longVal:J

.field next:Lcom/alibaba/fastjson/asm/Item;

.field strVal1:Ljava/lang/String;

.field strVal2:Ljava/lang/String;

.field strVal3:Ljava/lang/String;

.field type:I


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    return-void
.end method

.method constructor <init>(ILcom/alibaba/fastjson/asm/Item;)V
    .registers 5
    .param p1, "index"    # I
    .param p2, "i"    # Lcom/alibaba/fastjson/asm/Item;

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    iput p1, p0, Lcom/alibaba/fastjson/asm/Item;->index:I

    .line 95
    iget v0, p2, Lcom/alibaba/fastjson/asm/Item;->type:I

    iput v0, p0, Lcom/alibaba/fastjson/asm/Item;->type:I

    .line 96
    iget v0, p2, Lcom/alibaba/fastjson/asm/Item;->intVal:I

    iput v0, p0, Lcom/alibaba/fastjson/asm/Item;->intVal:I

    .line 97
    iget-wide v0, p2, Lcom/alibaba/fastjson/asm/Item;->longVal:J

    iput-wide v0, p0, Lcom/alibaba/fastjson/asm/Item;->longVal:J

    .line 98
    iget-object v0, p2, Lcom/alibaba/fastjson/asm/Item;->strVal1:Ljava/lang/String;

    iput-object v0, p0, Lcom/alibaba/fastjson/asm/Item;->strVal1:Ljava/lang/String;

    .line 99
    iget-object v0, p2, Lcom/alibaba/fastjson/asm/Item;->strVal2:Ljava/lang/String;

    iput-object v0, p0, Lcom/alibaba/fastjson/asm/Item;->strVal2:Ljava/lang/String;

    .line 100
    iget-object v0, p2, Lcom/alibaba/fastjson/asm/Item;->strVal3:Ljava/lang/String;

    iput-object v0, p0, Lcom/alibaba/fastjson/asm/Item;->strVal3:Ljava/lang/String;

    .line 101
    iget v0, p2, Lcom/alibaba/fastjson/asm/Item;->hashCode:I

    iput v0, p0, Lcom/alibaba/fastjson/asm/Item;->hashCode:I

    .line 102
    return-void
.end method


# virtual methods
.method isEqualTo(Lcom/alibaba/fastjson/asm/Item;)Z
    .registers 8
    .param p1, "i"    # Lcom/alibaba/fastjson/asm/Item;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 154
    iget v2, p0, Lcom/alibaba/fastjson/asm/Item;->type:I

    packed-switch v2, :pswitch_data_5a

    .line 173
    :pswitch_7
    iget-object v2, p1, Lcom/alibaba/fastjson/asm/Item;->strVal1:Ljava/lang/String;

    iget-object v3, p0, Lcom/alibaba/fastjson/asm/Item;->strVal1:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_57

    iget-object v2, p1, Lcom/alibaba/fastjson/asm/Item;->strVal2:Ljava/lang/String;

    iget-object v3, p0, Lcom/alibaba/fastjson/asm/Item;->strVal2:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_57

    iget-object v2, p1, Lcom/alibaba/fastjson/asm/Item;->strVal3:Ljava/lang/String;

    iget-object v3, p0, Lcom/alibaba/fastjson/asm/Item;->strVal3:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_57

    :cond_25
    :goto_25
    return v0

    .line 159
    :pswitch_26
    iget-object v0, p1, Lcom/alibaba/fastjson/asm/Item;->strVal1:Ljava/lang/String;

    iget-object v1, p0, Lcom/alibaba/fastjson/asm/Item;->strVal1:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_25

    .line 163
    :pswitch_2f
    iget-wide v2, p1, Lcom/alibaba/fastjson/asm/Item;->longVal:J

    iget-wide v4, p0, Lcom/alibaba/fastjson/asm/Item;->longVal:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_25

    move v0, v1

    goto :goto_25

    .line 166
    :pswitch_39
    iget v2, p1, Lcom/alibaba/fastjson/asm/Item;->intVal:I

    iget v3, p0, Lcom/alibaba/fastjson/asm/Item;->intVal:I

    if-eq v2, v3, :cond_25

    move v0, v1

    goto :goto_25

    .line 168
    :pswitch_41
    iget-object v2, p1, Lcom/alibaba/fastjson/asm/Item;->strVal1:Ljava/lang/String;

    iget-object v3, p0, Lcom/alibaba/fastjson/asm/Item;->strVal1:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_55

    iget-object v2, p1, Lcom/alibaba/fastjson/asm/Item;->strVal2:Ljava/lang/String;

    iget-object v3, p0, Lcom/alibaba/fastjson/asm/Item;->strVal2:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_25

    :cond_55
    move v0, v1

    goto :goto_25

    :cond_57
    move v0, v1

    .line 173
    goto :goto_25

    .line 154
    nop

    :pswitch_data_5a
    .packed-switch 0x1
        :pswitch_26
        :pswitch_7
        :pswitch_39
        :pswitch_39
        :pswitch_2f
        :pswitch_2f
        :pswitch_26
        :pswitch_26
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_41
        :pswitch_26
        :pswitch_7
        :pswitch_2f
    .end packed-switch
.end method

.method set(I)V
    .registers 4
    .param p1, "intVal"    # I

    .prologue
    .line 141
    const/4 v0, 0x3

    iput v0, p0, Lcom/alibaba/fastjson/asm/Item;->type:I

    .line 142
    iput p1, p0, Lcom/alibaba/fastjson/asm/Item;->intVal:I

    .line 143
    const v0, 0x7fffffff

    iget v1, p0, Lcom/alibaba/fastjson/asm/Item;->type:I

    add-int/2addr v1, p1

    and-int/2addr v0, v1

    iput v0, p0, Lcom/alibaba/fastjson/asm/Item;->hashCode:I

    .line 144
    return-void
.end method

.method set(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "type"    # I
    .param p2, "strVal1"    # Ljava/lang/String;
    .param p3, "strVal2"    # Ljava/lang/String;
    .param p4, "strVal3"    # Ljava/lang/String;

    .prologue
    const v2, 0x7fffffff

    .line 113
    iput p1, p0, Lcom/alibaba/fastjson/asm/Item;->type:I

    .line 114
    iput-object p2, p0, Lcom/alibaba/fastjson/asm/Item;->strVal1:Ljava/lang/String;

    .line 115
    iput-object p3, p0, Lcom/alibaba/fastjson/asm/Item;->strVal2:Ljava/lang/String;

    .line 116
    iput-object p4, p0, Lcom/alibaba/fastjson/asm/Item;->strVal3:Ljava/lang/String;

    .line 117
    sparse-switch p1, :sswitch_data_38

    .line 131
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v0

    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    move-result v1

    mul-int/2addr v0, v1

    invoke-virtual {p4}, Ljava/lang/String;->hashCode()I

    move-result v1

    mul-int/2addr v0, v1

    add-int/2addr v0, p1

    and-int/2addr v0, v2

    iput v0, p0, Lcom/alibaba/fastjson/asm/Item;->hashCode:I

    .line 133
    :goto_20
    return-void

    .line 122
    :sswitch_21
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v0

    add-int/2addr v0, p1

    and-int/2addr v0, v2

    iput v0, p0, Lcom/alibaba/fastjson/asm/Item;->hashCode:I

    goto :goto_20

    .line 125
    :sswitch_2a
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v0

    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    move-result v1

    mul-int/2addr v0, v1

    add-int/2addr v0, p1

    and-int/2addr v0, v2

    iput v0, p0, Lcom/alibaba/fastjson/asm/Item;->hashCode:I

    goto :goto_20

    .line 117
    :sswitch_data_38
    .sparse-switch
        0x1 -> :sswitch_21
        0x7 -> :sswitch_21
        0x8 -> :sswitch_21
        0xc -> :sswitch_2a
        0xd -> :sswitch_21
    .end sparse-switch
.end method
