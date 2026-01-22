# Modelfiles para Ollama

Este diretório contém Modelfiles para configurar modelos personalizados no Ollama.

## Como usar

### Criar um modelo a partir do Modelfile

```bash
ollama create nome-do-modelo -f modelfiles/arquivo.modelfile
```

### Exemplos

```bash
# Criar assistente de desenvolvimento
ollama create dev-assistant -f modelfiles/dev-assistant.modelfile

# Criar revisor de código
ollama create code-reviewer -f modelfiles/code-reviewer.modelfile

# Criar gerador de código
ollama create quick-coder -f modelfiles/quick-coder.modelfile
```

### Usar o modelo criado

```bash
ollama run dev-assistant "Como criar uma função de validação de email em Python?"
```

## Estrutura do Modelfile

### FROM (obrigatório)
Define o modelo base.

```dockerfile
# De um modelo do registry
FROM qwen2.5:7b

# De um arquivo GGUF local
FROM /caminho/para/modelo.gguf

# De outro modelo customizado
FROM meu-modelo:latest
```

### PARAMETER
Configura parâmetros de geração.

| Parâmetro | Descrição | Padrão | Range |
|-----------|-----------|--------|-------|
| `temperature` | Criatividade das respostas | 0.8 | 0.0-2.0 |
| `top_p` | Nucleus sampling | 0.9 | 0.0-1.0 |
| `top_k` | Top-k sampling | 40 | 1-100 |
| `num_ctx` | Tamanho do contexto (tokens) | 2048 | 512-32768 |
| `repeat_penalty` | Penalidade por repetição | 1.1 | 0.0-2.0 |
| `num_predict` | Max tokens na resposta | -1 | -1 = infinito |
| `stop` | Tokens de parada | - | string |

```dockerfile
PARAMETER temperature 0.7
PARAMETER num_ctx 4096
PARAMETER stop "<|im_end|>"
PARAMETER stop "###"
```

### SYSTEM
Define o system prompt (personalidade/instruções).

```dockerfile
SYSTEM """Você é um assistente especializado em Python.
Sempre forneça exemplos de código."""
```

### TEMPLATE
Personaliza o formato de prompt (avançado).

```dockerfile
TEMPLATE """{{ if .System }}<|system|>
{{ .System }}</s>
{{ end }}{{ if .Prompt }}<|user|>
{{ .Prompt }}</s>
{{ end }}<|assistant|>
{{ .Response }}</s>
"""
```

### MESSAGE
Adiciona mensagens de exemplo (few-shot).

```dockerfile
MESSAGE user "Como faço um loop em Python?"
MESSAGE assistant "```python
for i in range(10):
    print(i)
```"
```

### LICENSE
Adiciona informação de licença.

```dockerfile
LICENSE """MIT License - Use livremente"""
```

## Dicas

### Temperatura
- **0.0-0.3**: Respostas consistentes, bom para código/análise
- **0.4-0.7**: Balanceado, bom para uso geral
- **0.8-1.0**: Criativo, bom para brainstorming
- **>1.0**: Muito criativo/aleatório

### Contexto (num_ctx)
- **2048**: Padrão, suficiente para conversas curtas
- **4096**: Bom para análise de código médio
- **8192+**: Para arquivos grandes ou contexto extenso

### Performance
- Maior `num_ctx` = mais memória RAM/VRAM
- Modelos menores (1.5B-7B) são mais rápidos
- Use `num_predict` para limitar respostas longas

## Modelos disponíveis

```bash
# Listar modelos instalados
ollama list

# Remover modelo
ollama rm nome-do-modelo

# Ver info do modelo
ollama show nome-do-modelo
```
