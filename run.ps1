$rootDir = "."
$zboxDir = "zbox-app"
$dataDir = "$zboxDir\data"

Write-Host "Configurando el ecosistema de Zenergia..." -ForegroundColor Cyan

New-Item -ItemType Directory -Force -Path $dataDir | Out-Null
New-Item -ItemType Directory -Force -Path "img" | Out-Null

# Initialize the index.html file with the Big Picture Map
$htmlFile = "index.html"
@'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zenergia | Z-Box: Intelligent Bio-Hardware</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Space+Grotesk:wght@300;500&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Space Grotesk', sans-serif; background-color: #0a0a0a; color: #f4f4f4; }
        h1, h2, h3, .brand-font { font-family: 'Orbitron', sans-serif; font-weight: 900; }
        .glass { background: rgba(255, 255, 255, 0.03); backdrop-filter: blur(10px); border: 1px solid rgba(255, 255, 255, 0.05); }
        
        .gradient-text { background: linear-gradient(90deg, #94dafb 0%, #1389d4 100%); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }
        .hero-glow { position: absolute; top: -10%; left: 50%; transform: translateX(-50%); width: 600px; height: 400px; background: radial-gradient(circle, rgba(19, 137, 212, 0.1) 0%, rgba(10, 10, 10, 0) 70%); z-index: -1; }
        
        .text-zenergy-blue { color: #1389d4; }
        .bg-zenergy-blue { background-color: #1389d4; }
        .border-zenergy-blue { border-color: rgba(19, 137, 212, 0.3); }
        .custom-shadow { box-shadow: 0 10px 15px -3px rgba(19, 137, 212, 0.3); }
        
        .node-map { position: relative; width: 100%; height: 500px; background-color: rgba(255,255,255,0.01); border-radius: 1.5rem; border: 1px solid rgba(255,255,255,0.05); overflow: hidden; }
        .node-dot { position: absolute; width: 12px; height: 12px; border-radius: 50%; background-color: #1389d4; box-shadow: 0 0 10px rgba(19, 137, 212, 0.6); cursor: pointer; transition: all 0.3s ease; }
        .node-dot:hover { transform: scale(1.6); background-color: #fff; }
        .floating-button { position: fixed; bottom: 32px; right: 32px; z-index: 50; background-color: #1389d4; color: #000; font-weight: 900; font-size: 10px; letter-spacing: 0.2em; padding: 16px 32px; border-radius: 12px; box-shadow: 0 10px 25px -3px rgba(19, 137, 212, 0.4); text-transform: uppercase; transition: all 0.3s ease; }
        .floating-button:hover { transform: translateY(-2px); filter: brightness(1.2); }
    </style>
</head>
<body class="antialiased">
    <div class="hero-glow"></div>

    <nav class="py-8 px-6 flex justify-between items-center max-w-6xl mx-auto">
        <div class="flex items-center space-x-4">
            <img src="img/logo.png" alt="Zenergia Logo" class="w-10 h-10 object-contain">
            <span class="brand-font text-xl tracking-tighter uppercase">ZENERGIA</span>
        </div>
        <div class="hidden md:flex space-x-8 text-[10px] uppercase tracking-widest text-gray-400 items-center">
            <a href="#zbox" class="hover:text-zenergy-blue transition">Z-Box Node</a>
            <a href="#fractal-map" class="hover:text-zenergy-blue transition">The Big Picture</a>
            <a href="https://github.com/jalkn/zenErgy" target="_blank" class="text-white hover:text-zenergy-blue transition font-bold uppercase tracking-wider">
                GitHub
            </a>
            <a href="https://zenergy.streamlit.app" target="_blank" class="text-zenergy-blue font-bold border-l border-white/10 pl-8 animate-pulse">ARPA LIVE AUDIT</a>
        </div>
    </nav>

    <header class="max-w-6xl mx-auto px-6 pt-12 pb-24 grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
        <div>
            <span class="inline-block px-3 py-1 rounded-full border border-zenergy-blue text-zenergy-blue text-[10px] uppercase tracking-[0.2em] mb-6">Fase 1: Infraestructura Auditada</span>
            <h1 class="text-4xl md:text-5xl mb-8 uppercase tracking-tight leading-none">
                El ecosistema de <span class="gradient-text">1,597 Micronodos</span> en tus manos.
            </h1>
            <p class="text-lg text-gray-400 font-light max-w-lg mb-10 leading-relaxed">
                Estandarizamos la ingeniería de micelio mediante la <strong>Z-Box 60x40</strong>. El primer hardware asíncrono con control biocinético y validación de ondas estacionales.
            </p>
            <div class="flex flex-col sm:flex-row gap-4">
                <button onclick="window.open('https://wa.me/573025333130', '_blank')" class="bg-zenergy-blue text-black font-extrabold px-8 py-4 rounded-xl hover:scale-105 transition-all custom-shadow uppercase text-xs tracking-[0.2em]">
                    Reservar Nodo Z-Box
                </button>
            </div>
        </div>
        <div class="relative">
            <div class="glass p-4 rounded-[2.5rem] border border-white/10 shadow-2xl relative overflow-hidden">
                <img src="img/Untitled.png" alt="Z-Box Prototype" class="rounded-[2rem] w-full aspect-square object-cover opacity-90">
            </div>
        </div>
    </header>

    <section id="fractal-map" class="max-w-6xl mx-auto px-6 py-24 border-t border-white/5">
        <h2 class="text-2xl md:text-3xl brand-font tracking-tight mb-8 uppercase">
            The <span class="gradient-text">Big Picture</span>: Mapa de Micronodos
        </h2>
        <p class="text-sm text-gray-400 max-w-2xl mb-12">
            Nodos distribuidos bajo proporciones áureas y secuencias de Fibonacci. Haz clic en los puntos interactivos para establecer comunicación por frecuencia de resonancia hacia la red de Zenergia.
        </p>

        <div class="node-map">
            <div class="absolute inset-0 flex items-center justify-center text-[10px] tracking-widest text-gray-700 select-none">
                <span>[ MATRIZ DE MICELIO H ∩ T ]</span>
            </div>
            <a href="https://wa.me/573025333130?text=Hola,%20nodo%201%20activo%20en%20frecuencia%20de%20resonancia%201" target="_blank">
                <div class="node-dot" style="top: 25%; left: 35%;" title="Frecuencia 1: 1.618 Hz"></div>
            </a>
            <a href="https://wa.me/573025333130?text=Hola,%20nodo%202%20activo%20en%20frecuencia%20de%20resonancia%202" target="_blank">
                <div class="node-dot" style="top: 40%; left: 58%;" title="Frecuencia 2: 2.618 Hz"></div>
            </a>
            <a href="https://wa.me/573025333130?text=Hola,%20nodo%203%20activo%20en%20frecuencia%20de%20resonancia%203" target="_blank">
                <div class="node-dot" style="top: 65%; left: 45%;" title="Frecuencia 3: 4.236 Hz"></div>
            </a>
            <a href="https://wa.me/573025333130?text=Hola,%20nodo%205%20activo%20en%20frecuencia%20de%20resonancia%205" target="_blank">
                <div class="node-dot" style="top: 30%; left: 72%;" title="Frecuencia 5: 6.854 Hz"></div>
            </a>
            <a href="https://wa.me/573025333130?text=Hola,%20nodo%208%20activo%20en%20frecuencia%20de%20resonancia%208" target="_blank">
                <div class="node-dot" style="top: 55%; left: 25%;" title="Frecuencia 8: 11.090 Hz"></div>
            </a>
        </div>
    </section>

    <a href="#fractal-map">
        <button class="floating-button">
            ↑ Volver al Mapa
        </button>
    </a>

    <section id="zbox" class="max-w-6xl mx-auto px-6 py-24 border-t border-white/5">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div class="glass p-8 rounded-3xl border-t-2 border-zenergy-blue">
                <h3 class="brand-font text-lg mb-4 uppercase">Hardware Z-Box</h3>
                <p class="text-sm text-gray-400 mb-6">Control asíncrono (FastAPI) y automatización para registrar lotes de sustrato y biomasa con gran precisión.</p>
                <ul class="text-[10px] space-y-2 text-zenergy-blue uppercase tracking-widest font-bold">
                    <li>● Control de 34 a 55 Ondas</li>
                    <li>● Ecosistema Asíncrono</li>
                </ul>
            </div>

            <div class="glass p-8 rounded-3xl border-t-2 border-white/10">
                <h3 class="brand-font text-lg mb-4 uppercase">Bio-Land-Art</h3>
                <p class="text-sm text-gray-400 mb-6">Huevos semilla y bloques validados geométricamente para renderizado visual en 4K AR y construcción ecológica.</p>
                <ul class="text-[10px] space-y-2 text-gray-500 uppercase tracking-widest">
                    <li>● Geometría múltiple de 90°</li>
                    <li>● Trazabilidad de lotes</li>
                </ul>
            </div>

            <div class="glass p-8 rounded-3xl border-t-2 border-zenergy-blue bg-zenergy-blue/5">
                <h3 class="brand-font text-lg mb-4 uppercase">Protocolo ARPA</h3>
                <p class="text-sm text-gray-400 mb-6">Encripta y sella la telemetría de los micronodos, certificando cada lote como un activo digital.</p>
                <ul class="text-[10px] space-y-2 text-zenergy-blue uppercase tracking-widest font-bold">
                    <li>● Validación de Fases H ∩ T</li>
                    <li>● Hash Biocinético</li>
                </ul>
            </div>
        </div>
    </section>

    <footer class="max-w-6xl mx-auto px-6 py-20 text-center border-t border-white/5 flex flex-col items-center">
        <p class="brand-font text-[10px] text-gray-600 tracking-[0.3em] uppercase mb-4">Zenergia.world | Santa Elena, Colombia</p>
        <a href="https://github.com/jalkn/zenErgy" target="_blank" class="text-xs text-zenergy-blue hover:text-white transition tracking-widest uppercase">
            &mdash; View Source Code on GitHub &mdash;
        </a>
    </footer>
</body>
</html>
'@ | Set-Content $htmlFile -Encoding utf8

$fastApiFile = "zbox_protocol.py"
@'
from fastapi import FastAPI, HTTPException, status
from pydantic import BaseModel, Field
from typing import Dict, Any, Optional
from datetime import datetime
import math

app = FastAPI(
    title="Zenergy Z-Box 60x40 API",
    version="1.0.0-beta",
    description="Ecosistema de control asíncrono y encriptación biocinética"
)

# Sensor validation model for the 1,597 micronodes
class SensorData(BaseModel):
    temperature: float = Field(..., description="Temperatura interna en °C")
    humidity: float = Field(..., description="Humedad relativa en %")
    co2_ppm: float = Field(..., description="Nivel de CO2 en ppm")
    resonance_phase: bool = Field(..., description="Estado de resonancia booleana H interseca T")

# Seed registry model for Bio-Land-Art geometry
class BioLandArtSeed(BaseModel):
    batch_id: str
    seed_type: str
    rotation_angle: int = Field(..., ge=0, le=360, description="Sistema de rotación de 90°")
    mass_g: float

class BiokineticEngine:
    def __init__(self, node_id: str):
        self.node_id = node_id
    
    def calculate_intersection(self, h: float, t: float, h_min: float, t_max: float) -> bool:
        return h >= h_min and t <= t_max

    def compose_state(self, action: str, response: str) -> str:
        return f"{action} -> {response}"

    def get_geometry_state(self, angle: int) -> Dict[str, Any]:
        is_valid_angle = angle % 90 == 0
        return {
            "angle": angle,
            "normalized_angle": angle / 360,
            "render_in_4k": is_valid_angle,
            "geometry_type": "semicircle_inclusion" if is_valid_angle else "unaligned"
        }

engine = BiokineticEngine(node_id="Z-BOX-60x40-01")

@app.post("/api/v1/telemetry", status_code=status.HTTP_201_CREATED)
async def process_telemetry(data: SensorData):
    is_in_resonance = engine.calculate_intersection(data.humidity, data.temperature, 85.0, 24.0)
    if not is_in_resonance:
        return {
            "status": "out_of_phase",
            "message": "Composición de resonancia no alcanzada. Comprobando vectores."
        }
    return {
        "status": "in_resonance",
        "timestamp": datetime.utcnow().isoformat(),
        "composition_result": engine.compose_state("Ventilacion Forzada", "Resonancia Biológica Validada")
    }

@app.post("/api/v1/seed_art", status_code=status.HTTP_201_CREATED)
async def register_seed(seed: BioLandArtSeed):
    geom_data = engine.get_geometry_state(seed.rotation_angle)
    if not geom_data["render_in_4k"]:
        raise HTTPException(
            status_code=400, 
            detail="El ángulo del huevo semilla no cumple con la geometría de rotación funcional (múltiplos de 90°)."
        )
    return {
        "batch_id": seed.batch_id,
        "geometry_metadata": geom_data,
        "biokinetic_hash": f"zenergy_hash_{hash(seed.batch_id)}",
        "saved": True
    }
'@ | Set-Content $fastApiFile -Encoding utf8

Write-Host "Ecosistema Zenergia inicializado correctamente." -ForegroundColor Green
Write-Host "Ejecuta: uvicorn zbox_protocol:app --reload" -ForegroundColor Yellow