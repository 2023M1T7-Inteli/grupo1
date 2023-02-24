extends KinematicBody2D

# variáveis
var screen_size
onready var global = get_node("/root/Global")
onready var listaComandos = global.listaComandos
onready var estado = global.estado
var i = 0

# funções
func _ready():
	screen_size = get_viewport_rect().size
	
	

func _physics_process(delta):
	if i < 3:
		print("Hello")
		print(estado)
		i +=1
		
	if $"/root/Global".estado:
		print("deu certo")
		movimentacao()
		$"/root/Global".estado = false
		
	

func movimentacao():
	var velocidade = Vector2.ZERO
	for i in len(listaComandos):
		if listaComandos[i] == "left":
			velocidade.x -= 10
		if listaComandos[i] == "right":
			velocidade.x += 10
		if listaComandos[i] == "up":
			velocidade.y -= 10
		if listaComandos[i] == "down":
			velocidade.y[i] += 10
	move_and_slide(velocidade*300)
	yield(get_tree().create_timer(5.0), "timeout")
	print(position)

# função para esperar alguns segundos
func wait():
	var tempo = $"../Timer"
	tempo.wait_time = 10

# Utilização em um teste. Dentro de process(delta)
#var vector_movement = Vector2.ZERO # Atribuição no vetor 2D
	#vector_movement.x = Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left") # Atribuir o x ao vetor
	#vector_movement.y = Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up") # Atribuir o y ao vetor
	
	#move_and_slide(vector_movement*500) # Usando a função move_and_slide junto com o vetor multiplicado pela velocidade
	
	# Colocando limites (borda)
	#position += vector_movement*300
	#position.x = clamp(position.x, 0, screen_size.x)
	#position.y = clamp(position.y, 0, screen_size.y)
