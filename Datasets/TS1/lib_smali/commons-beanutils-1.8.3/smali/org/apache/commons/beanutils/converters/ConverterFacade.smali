.class public final Lorg/apache/commons/beanutils/converters/ConverterFacade;
.super Ljava/lang/Object;
.source "ConverterFacade.java"

# interfaces
.implements Lorg/apache/commons/beanutils/Converter;


# instance fields
.field private final converter:Lorg/apache/commons/beanutils/Converter;


# direct methods
.method public constructor <init>(Lorg/apache/commons/beanutils/Converter;)V
    .registers 4
    .param p1, "converter"    # Lorg/apache/commons/beanutils/Converter;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    if-nez p1, :cond_d

    .line 45
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Converter is missing"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 47
    :cond_d
    iput-object p1, p0, Lorg/apache/commons/beanutils/converters/ConverterFacade;->converter:Lorg/apache/commons/beanutils/Converter;

    .line 48
    return-void
.end method


# virtual methods
.method public convert(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 60
    iget-object v0, p0, Lorg/apache/commons/beanutils/converters/ConverterFacade;->converter:Lorg/apache/commons/beanutils/Converter;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/beanutils/Converter;->convert(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 71
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "ConverterFacade["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/beanutils/converters/ConverterFacade;->converter:Lorg/apache/commons/beanutils/Converter;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
