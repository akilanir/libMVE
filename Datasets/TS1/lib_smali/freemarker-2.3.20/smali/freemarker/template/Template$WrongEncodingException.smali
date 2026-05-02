.class public Lfreemarker/template/Template$WrongEncodingException;
.super Lfreemarker/core/ParseException;
.source "Template.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/template/Template;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WrongEncodingException"
.end annotation


# instance fields
.field public specifiedEncoding:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "specifiedEncoding"    # Ljava/lang/String;

    .prologue
    .line 725
    invoke-direct {p0}, Lfreemarker/core/ParseException;-><init>()V

    .line 726
    iput-object p1, p0, Lfreemarker/template/Template$WrongEncodingException;->specifiedEncoding:Ljava/lang/String;

    .line 727
    return-void
.end method
