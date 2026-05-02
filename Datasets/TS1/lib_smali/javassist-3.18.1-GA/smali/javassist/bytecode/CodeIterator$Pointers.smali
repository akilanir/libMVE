.class Ljavassist/bytecode/CodeIterator$Pointers;
.super Ljava/lang/Object;
.source "CodeIterator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/CodeIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Pointers"
.end annotation


# instance fields
.field cursor:I

.field etable:Ljavassist/bytecode/ExceptionTable;

.field line:Ljavassist/bytecode/LineNumberAttribute;

.field mark:I

.field mark0:I

.field stack:Ljavassist/bytecode/StackMapTable;

.field stack2:Ljavassist/bytecode/StackMap;

.field types:Ljavassist/bytecode/LocalVariableAttribute;

.field vars:Ljavassist/bytecode/LocalVariableAttribute;


# direct methods
.method constructor <init>(IIILjavassist/bytecode/ExceptionTable;Ljavassist/bytecode/CodeAttribute;)V
    .registers 7
    .param p1, "cur"    # I
    .param p2, "m"    # I
    .param p3, "m0"    # I
    .param p4, "et"    # Ljavassist/bytecode/ExceptionTable;
    .param p5, "ca"    # Ljavassist/bytecode/CodeAttribute;

    .prologue
    .line 1017
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1018
    iput p1, p0, Ljavassist/bytecode/CodeIterator$Pointers;->cursor:I

    .line 1019
    iput p2, p0, Ljavassist/bytecode/CodeIterator$Pointers;->mark:I

    .line 1020
    iput p3, p0, Ljavassist/bytecode/CodeIterator$Pointers;->mark0:I

    .line 1021
    iput-object p4, p0, Ljavassist/bytecode/CodeIterator$Pointers;->etable:Ljavassist/bytecode/ExceptionTable;

    .line 1022
    const-string v0, "LineNumberTable"

    invoke-virtual {p5, v0}, Ljavassist/bytecode/CodeAttribute;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/LineNumberAttribute;

    iput-object v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->line:Ljavassist/bytecode/LineNumberAttribute;

    .line 1023
    const-string v0, "LocalVariableTable"

    invoke-virtual {p5, v0}, Ljavassist/bytecode/CodeAttribute;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/LocalVariableAttribute;

    iput-object v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->vars:Ljavassist/bytecode/LocalVariableAttribute;

    .line 1024
    const-string v0, "LocalVariableTypeTable"

    invoke-virtual {p5, v0}, Ljavassist/bytecode/CodeAttribute;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/LocalVariableAttribute;

    iput-object v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->types:Ljavassist/bytecode/LocalVariableAttribute;

    .line 1025
    const-string v0, "StackMapTable"

    invoke-virtual {p5, v0}, Ljavassist/bytecode/CodeAttribute;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/StackMapTable;

    iput-object v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->stack:Ljavassist/bytecode/StackMapTable;

    .line 1026
    const-string v0, "StackMap"

    invoke-virtual {p5, v0}, Ljavassist/bytecode/CodeAttribute;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/StackMap;

    iput-object v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->stack2:Ljavassist/bytecode/StackMap;

    .line 1027
    return-void
.end method


# virtual methods
.method shiftForSwitch(II)V
    .registers 4
    .param p1, "where"    # I
    .param p2, "gapLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 1057
    iget-object v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->stack:Ljavassist/bytecode/StackMapTable;

    if-eqz v0, :cond_9

    .line 1058
    iget-object v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->stack:Ljavassist/bytecode/StackMapTable;

    invoke-virtual {v0, p1, p2}, Ljavassist/bytecode/StackMapTable;->shiftForSwitch(II)V

    .line 1060
    :cond_9
    iget-object v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->stack2:Ljavassist/bytecode/StackMap;

    if-eqz v0, :cond_12

    .line 1061
    iget-object v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->stack2:Ljavassist/bytecode/StackMap;

    invoke-virtual {v0, p1, p2}, Ljavassist/bytecode/StackMap;->shiftForSwitch(II)V

    .line 1062
    :cond_12
    return-void
.end method

.method shiftPc(IIZ)V
    .registers 5
    .param p1, "where"    # I
    .param p2, "gapLength"    # I
    .param p3, "exclusive"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 1030
    iget v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->cursor:I

    if-lt p1, v0, :cond_a

    iget v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->cursor:I

    if-ne p1, v0, :cond_f

    if-eqz p3, :cond_f

    .line 1031
    :cond_a
    iget v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->cursor:I

    add-int/2addr v0, p2

    iput v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->cursor:I

    .line 1033
    :cond_f
    iget v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->mark:I

    if-lt p1, v0, :cond_19

    iget v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->mark:I

    if-ne p1, v0, :cond_1e

    if-eqz p3, :cond_1e

    .line 1034
    :cond_19
    iget v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->mark:I

    add-int/2addr v0, p2

    iput v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->mark:I

    .line 1036
    :cond_1e
    iget v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->mark0:I

    if-lt p1, v0, :cond_28

    iget v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->mark0:I

    if-ne p1, v0, :cond_2d

    if-eqz p3, :cond_2d

    .line 1037
    :cond_28
    iget v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->mark0:I

    add-int/2addr v0, p2

    iput v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->mark0:I

    .line 1039
    :cond_2d
    iget-object v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->etable:Ljavassist/bytecode/ExceptionTable;

    invoke-virtual {v0, p1, p2, p3}, Ljavassist/bytecode/ExceptionTable;->shiftPc(IIZ)V

    .line 1040
    iget-object v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->line:Ljavassist/bytecode/LineNumberAttribute;

    if-eqz v0, :cond_3b

    .line 1041
    iget-object v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->line:Ljavassist/bytecode/LineNumberAttribute;

    invoke-virtual {v0, p1, p2, p3}, Ljavassist/bytecode/LineNumberAttribute;->shiftPc(IIZ)V

    .line 1043
    :cond_3b
    iget-object v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->vars:Ljavassist/bytecode/LocalVariableAttribute;

    if-eqz v0, :cond_44

    .line 1044
    iget-object v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->vars:Ljavassist/bytecode/LocalVariableAttribute;

    invoke-virtual {v0, p1, p2, p3}, Ljavassist/bytecode/LocalVariableAttribute;->shiftPc(IIZ)V

    .line 1046
    :cond_44
    iget-object v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->types:Ljavassist/bytecode/LocalVariableAttribute;

    if-eqz v0, :cond_4d

    .line 1047
    iget-object v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->types:Ljavassist/bytecode/LocalVariableAttribute;

    invoke-virtual {v0, p1, p2, p3}, Ljavassist/bytecode/LocalVariableAttribute;->shiftPc(IIZ)V

    .line 1049
    :cond_4d
    iget-object v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->stack:Ljavassist/bytecode/StackMapTable;

    if-eqz v0, :cond_56

    .line 1050
    iget-object v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->stack:Ljavassist/bytecode/StackMapTable;

    invoke-virtual {v0, p1, p2, p3}, Ljavassist/bytecode/StackMapTable;->shiftPc(IIZ)V

    .line 1052
    :cond_56
    iget-object v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->stack2:Ljavassist/bytecode/StackMap;

    if-eqz v0, :cond_5f

    .line 1053
    iget-object v0, p0, Ljavassist/bytecode/CodeIterator$Pointers;->stack2:Ljavassist/bytecode/StackMap;

    invoke-virtual {v0, p1, p2, p3}, Ljavassist/bytecode/StackMap;->shiftPc(IIZ)V

    .line 1054
    :cond_5f
    return-void
.end method
