extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocidade = 100
var booleano = false
var musica = 1
var entreiAqui1 = false
var entreiAqui2 = false
#
## Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	var vetor_entrada=Vector2.ZERO
	vetor_entrada.x = Input.get_action_strength("ui_dir")-Input.get_action_strength("ui_esq")
	vetor_entrada.y = Input.get_action_strength("ui_baixo")-Input.get_action_strength("ui_alto")

	if((Input.is_action_pressed("tiro_blue")) && (booleano==false)):
		booleano = true
	else:
		booleano = false

	if(booleano):
		move_and_slide(vetor_entrada*(velocidade+50))
	else:
		move_and_slide(vetor_entrada*(velocidade-50))

	if(Input.is_action_just_pressed("music") && musica == 2):
		musica = 1
		print("musica 1 selecionada")
	elif(Input.is_action_just_pressed("music") && musica == 1):
		musica = 2
		print("musica 2 selecionada")


	if(musica == 1 && entreiAqui1==false):
		$AudioStreamPlayer.stream = load("res://ghost.mp3")
		$AudioStreamPlayer.play()
		entreiAqui1 = true
		entreiAqui2 = false
		print("musica 1 rodando")
	elif(musica == 2 && entreiAqui2==false):
		$AudioStreamPlayer.stream = load("res://march.mp3")
		$AudioStreamPlayer.play()
		entreiAqui1 = false
		entreiAqui2 = true
		print("musica 2 rodando")
