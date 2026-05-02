.class Lorg/mozilla/javascript/tools/debugger/MessageDialogWrapper;
.super Ljava/lang/Object;
.source "SwingGui.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 943
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static showMessageDialog(Ljava/awt/Component;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 13
    .param p0, "parent"    # Ljava/awt/Component;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "flags"    # I

    .prologue
    const/16 v8, 0x3c

    .line 951
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    if-le v7, v8, :cond_4a

    .line 952
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 953
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    .line 954
    .local v5, "len":I
    const/4 v3, 0x0

    .line 956
    .local v3, "j":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_13
    if-ge v2, v5, :cond_46

    .line 957
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 958
    .local v1, "c":C
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 959
    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v7

    if-eqz v7, :cond_3e

    .line 961
    add-int/lit8 v4, v2, 0x1

    .local v4, "k":I
    :goto_24
    if-ge v4, v5, :cond_30

    .line 962
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-static {v7}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v7

    if-eqz v7, :cond_43

    .line 966
    :cond_30
    if-ge v4, v5, :cond_3e

    .line 967
    sub-int v6, v4, v2

    .line 968
    .local v6, "nextWordLen":I
    add-int v7, v3, v6

    if-le v7, v8, :cond_3e

    .line 969
    const/16 v7, 0xa

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 970
    const/4 v3, 0x0

    .line 956
    .end local v4    # "k":I
    .end local v6    # "nextWordLen":I
    :cond_3e
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    .line 961
    .restart local v4    # "k":I
    :cond_43
    add-int/lit8 v4, v4, 0x1

    goto :goto_24

    .line 975
    .end local v1    # "c":C
    .end local v4    # "k":I
    :cond_46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 977
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    .end local v2    # "i":I
    .end local v3    # "j":I
    .end local v5    # "len":I
    :cond_4a
    invoke-static {p0, p1, p2, p3}, Ljavax/swing/JOptionPane;->showMessageDialog(Ljava/awt/Component;Ljava/lang/Object;Ljava/lang/String;I)V

    .line 978
    return-void
.end method
