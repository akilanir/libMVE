.class public Lorg/dmfs/android/xmlmagic/StringFormatter;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static format(Ljava/lang/CharSequence;Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;I)Ljava/lang/CharSequence;
    .registers 11

    const/16 v7, 0x7d

    const/16 v6, 0x7b

    if-nez p1, :cond_7

    :cond_6
    :goto_6
    return-object p0

    :cond_7
    if-eqz p0, :cond_6

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x2

    if-le v0, v1, :cond_6

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v3

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_16
    invoke-static {p0, v6, v1}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;CI)I

    move-result v2

    if-ltz v2, :cond_2f

    if-nez v0, :cond_23

    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    :cond_23
    invoke-interface {p0, v1, v2}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    add-int/lit8 v1, v3, -0x1

    if-ne v2, v1, :cond_3a

    move v1, v2

    :cond_2f
    if-eqz v0, :cond_6

    invoke-interface {p0, v1, v3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-object p0, v0

    goto :goto_6

    :cond_3a
    add-int/lit8 v1, v2, 0x1

    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    if-ne v1, v7, :cond_48

    invoke-virtual {v0, v6}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    add-int/lit8 v1, v2, 0x2

    goto :goto_16

    :cond_48
    add-int/lit8 v1, v2, 0x1

    invoke-static {p0, v7, v1}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;CI)I

    move-result v4

    if-gez v4, :cond_6f

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid token string \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6f
    add-int/lit8 v1, v2, 0x1

    invoke-interface {p0, v1, v4}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;->resolveToken(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v1, :cond_9a

    if-eqz p2, :cond_8d

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v5, "@string/"

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_93

    :cond_8d
    :goto_8d
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    :goto_90
    add-int/lit8 v1, v4, 0x1

    goto :goto_16

    :cond_93
    add-int/lit8 v2, p2, -0x1

    invoke-static {v1, p1, v2}, Lorg/dmfs/android/xmlmagic/StringFormatter;->format(Ljava/lang/CharSequence;Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;I)Ljava/lang/CharSequence;

    move-result-object v1

    goto :goto_8d

    :cond_9a
    invoke-virtual {v0, v6}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0, v7}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    goto :goto_90
.end method
